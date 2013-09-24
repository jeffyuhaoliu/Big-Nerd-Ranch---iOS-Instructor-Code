//
//  main.m
//  BMITime
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
		BNREmployee *mikey = [[BNREmployee alloc] init];
		
		// Give the instance variables interesting values
		mikey.weightInKilos = 96;
		mikey.heightInMeters = 1.8;
        mikey.employeeID = 15;
        mikey.hireDate = [NSDate date];
		
        NSLog(@"Mikey:");
//        NSLog(@"Employee %u hired on %@", mikey.employeeID, mikey.hireDate);
        NSLog(@"%@ hired on %@", mikey, mikey.hireDate);
        
		float bmi = [mikey bodyMassIndex];
        double years = [mikey yearsOfEmployment];
		NSLog(@"BMI of %.2f has worked with us of %.2f years",
              bmi, years);
        
    }
    return 0;
}

