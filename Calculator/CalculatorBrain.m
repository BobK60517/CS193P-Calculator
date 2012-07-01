//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Bob Keefe on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;
// Override the getter so we can perform lazy instantiation of operandStack
-(NSMutableArray *)operandStack {
    if (!_operandStack) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

-(void)pushOperand:(double)operand {
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double)popOperand {
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *)operation {
    double result = 0;
    
    // perform operation here, store answer in "result"
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"-"]) {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"/"]) {
        // I pop both operands off, even when dividing by zero
        double divisor = [self popOperand];
        double numerand = [self popOperand];
        if (divisor) result = numerand / divisor;
    }
    
    [self pushOperand:result]; // put result back on stack for next operation
    
    return result;
}

@end
