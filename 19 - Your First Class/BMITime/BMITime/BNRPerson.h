//
//  BNRPerson.h
//  BMITime
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject
{
    // It has two instance variables
	float _heightInMeters;
	int _weightInKilos;
}

// You will be able to set those instance variables using these methods
- (float)heightInMeters;
- (void)setHeightInMeters:(float)h;
- (int)weightInKilos;
- (void)setWeightInKilos:(int)w;

// This method calculates the Body Mass Index
- (float)bodyMassIndex;

@end
