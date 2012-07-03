//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Bob Keefe on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize history = _history;
@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;
// Lazily instanstiate the _brain
-(CalculatorBrain *)brain {
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    // Handle decimal point (allow only one per number)
    if ([digit isEqualToString:@"."]) {
        NSRange range = [self.display.text rangeOfString:@"."];
        if (range.location != NSNotFound
            && self.userIsInTheMiddleOfEnteringANumber) digit = @"";
    }
    
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.history.text = [NSString stringWithFormat:@"%@ %@", self.history.text, self.display.text];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    NSString *operation = sender.currentTitle;
    double result = [self.brain performOperation:operation];
    self.history.text = [NSString stringWithFormat:@"%@ %@", self.history.text, operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)clearPressed {
    self.history.text = @"";
    self.display.text = @"";
    self.userIsInTheMiddleOfEnteringANumber = NO;
    [self.brain clearAllOperands];
}

- (void)viewDidUnload {
    [self setHistory:nil];
    [self setHistory:nil];
    [super viewDidUnload];
}
@end
