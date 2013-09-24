//
//  BNRPerson.h
//  BMITime
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject
// These instance variables will be synthesized given the properties below
//{
//	float _heightInMeters;
//	int _weightInKilos;
//}

@property float heightInMeters;
@property int weightInKilos;

- (float)bodyMassIndex;

@end
