//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Bob Keefe on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//  Trying to update git

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;
-(void)clearAllOperands;

@end
