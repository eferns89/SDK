//
//  ViewController.h
//  iOSBasicExample
//
//  Created by Dave Rai on 2014-10-30.
//  Copyright (c) 2014 Nymi Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "NclWrapper.h"

@interface ViewController : UIViewController <NclEventProtocol>



// conform to ncl event protocol implementation
-(void) incomingNclEvent: (NclEvent* ) nclEvent;

@end

