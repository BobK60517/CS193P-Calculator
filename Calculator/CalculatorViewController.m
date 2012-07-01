//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Bob Keefe on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@end

@implementation CalculatorViewController
@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}
- (IBAction)enterPressed {
}

- (IBAction)operationPressed:(UIButton *)sender {
}

@end
