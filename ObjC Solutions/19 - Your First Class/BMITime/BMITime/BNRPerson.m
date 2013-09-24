//
//  BNRPerson.m
//  BMITime
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

- (float)heightInMeters
{
	return _heightInMeters;
}

- (void)setHeightInMeters:(float)h
{
	_heightInMeters = h;
}

- (int)weightInKilos
{
	return _weightInKilos;
}

- (void)setWeightInKilos:(int)w
{
	_weightInKilos = w;
}

- (float)bodyMassIndex
{
	return _weightInKilos / (_heightInMeters * _heightInMeters);
}

@end
