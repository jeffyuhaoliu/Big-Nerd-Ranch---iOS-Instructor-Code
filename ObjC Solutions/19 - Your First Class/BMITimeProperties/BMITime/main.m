//
//  main.m
//  BMITime
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
		BNRPerson *mikey = [[BNRPerson alloc] init];
		
		// Give the instance variables interesting values
		mikey.weightInKilos = 96;
		mikey.heightInMeters = 1.8;
		
		// Call the bodyMassIndex method
		float bmi = [mikey bodyMassIndex];
		NSLog(@"mikey (%d, %.2f) has a BMI of %f",
              mikey.weightInKilos, mikey.heightInMeters, bmi);
        
    }
    return 0;
}

