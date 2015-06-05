//
//  ViewController.m
//  iOSBasicExample
//
//  Created by Dave Rai on 2014-10-30.
//  Copyright (c) 2014 Nymi Inc. All rights reserved.
//

#import "ViewController.h"
#include "ncl.h"

@interface ViewController ()

@property BOOL nymiBandProvsioned, nclInitEventFailure;

@property NclWrapper* myNcl;

@property (weak, nonatomic) IBOutlet UITextView *outputTextBox;
@property (weak, nonatomic) IBOutlet UIButton *nymiButton;

// helper method used to update UI asynchrously
- (void) updateUiText: (NSString*) withString;

@end

@implementation ViewController

@synthesize myNcl, outputTextBox, nymiBandProvsioned, nymiButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Nymi button is used to move throught the different states
// of provisioning and validating the Nymi Band
- (IBAction)nymiButtonTap:(id)sender {
    if (!nymiBandProvsioned) {
        
        myNcl = [[NclWrapper alloc] init];
        
        // set the delegate to get things started and intialize NCL
        [myNcl setEventTypeToWaitFor:NCL_EVENT_INIT];
        [myNcl setNclDelegate: (self)];
        
        self.outputTextBox.text=@"NCL Initialized, waiting for init event\n";
        
        [myNcl waitNclForEvent];    }
    else {
        self.outputTextBox.text=@"Nymi Band already provisioned, in validate step\n";
        [self.outputTextBox insertText:(@"Finding provisioned Nymi Band...\n")];
        [myNcl setEventTypeToWaitFor:NCL_EVENT_FIND];
        [myNcl findNymiBand];
        [myNcl waitNclForEvent];    }
    


    self.nymiButton.hidden=YES;


}


// Method called when NCL events are received
- (void) incomingNclEvent:(NclEvent *)nclEvent{
    
    NSLog(@"delegate called");
    
    NclEvent currentEvent = *nclEvent;
    if (!nymiBandProvsioned) {
        switch (currentEvent.type)
        {
            case NCL_EVENT_INIT:
                // initialized, event, have to check it if it was successful before we move to discovery
                if (currentEvent.init.success) {
                    [self updateUiText:(@"NCL Initialized, discovering Nymi Band...\n")];
                    [myNcl setEventTypeToWaitFor:NCL_EVENT_DISCOVERY];
                    [myNcl discoverNymiBand];
                    [myNcl waitNclForEvent];
                }
                else {
                    [self updateUiText:(@"NCL initilize event returned error\n")];
                    [self updateUiText:(@"Make sure Nymulator is running\n")];
                    [self updateUiText: (@"And run this example again\n")];
                    self.nclInitEventFailure=YES;
                    self.nymiButton.hidden=YES;
                }

                break;
                
            case NCL_EVENT_DISCOVERY:
                // normally, would display LED pattern to expect to user and ask for validation
                // here for simplicity we assume agreement
                [self updateUiText:(@"Nymi Band discovered, agreeing...\n")];
                [myNcl setEventTypeToWaitFor:NCL_EVENT_AGREEMENT];
                [myNcl agreeNymiBand:(currentEvent.discovery.nymiHandle)];
                [myNcl waitNclForEvent];
                break;
                
            case NCL_EVENT_AGREEMENT:
                [self updateUiText:(@"Agreed, provisioning ...\n")];
                [myNcl setEventTypeToWaitFor:NCL_EVENT_PROVISION];
                [myNcl provisionNymiBand:(currentEvent.agreement.nymiHandle)];
                [myNcl waitNclForEvent];
                break;
                
            case NCL_EVENT_PROVISION:
                [self updateUiText:(@"Nymi Band provisioned\nTap Nymi button to move to validate steps\n")];
                [myNcl disconnectNymiBand:(currentEvent.provision.nymiHandle)];
                nymiBandProvsioned=YES;
                
                // the NEA should persist the provsion, for this simple example, the NCL wrapper keeps the current provision
                // it is used to find the same Nymi Band on subsequent calls
                //if (nymiProvsioned)
                if (nymiBandProvsioned)
                    dispatch_async(dispatch_get_main_queue(),
                                   ^{
                                       [self.nymiButton setHidden:(NO)];
                                   });
                
                break;
                
            default:
                break;
        }//end switch on event type
    }
    
    else {    // if already provisioned, we just have to find the nymi and validate
        switch (currentEvent.type) {
            case NCL_EVENT_FIND:
                [self updateUiText:(@"Found Nymi, validating...\n")];
                [myNcl setEventTypeToWaitFor:NCL_EVENT_VALIDATION];
                [myNcl validateNymiBand:(currentEvent.find.nymiHandle)];
                [myNcl waitNclForEvent];
                [myNcl stopScan];
                break;
                
            case NCL_EVENT_VALIDATION:
                [self updateUiText:(@"Nymi validated, NEA can perform actions for validated user\n")];
                [myNcl disconnectNymiBand:(currentEvent.validation.nymiHandle)];
                if (nymiBandProvsioned)
                    dispatch_async(dispatch_get_main_queue(),
                                   ^{
                                       [self.nymiButton setHidden:(NO)];
                                   });
                
                
            default:
                break;
        }
    }
}

- (void) updateUiText:(NSString *)withString
{
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       [self.outputTextBox insertText:(withString)];
                   });
}


@end
