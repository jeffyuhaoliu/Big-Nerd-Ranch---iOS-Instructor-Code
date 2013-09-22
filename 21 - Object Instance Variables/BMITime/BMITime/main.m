//
//  main.m
//  BMITime
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
	    
		// Create an array of BNREmployee objects
		NSMutableArray *employees = [[NSMutableArray alloc] init];
		
		for (int i = 0; i < 10; i++) {
			
			// Create an instance of BNREmployee
			BNREmployee *person = [[BNREmployee alloc] init];
			
			// Give the instance variables interesting values
			person.weightInKilos = 90 + i;
			person.heightInMeters = 1.8 - i/10.0;
			person.employeeID = i;
			
			// Put the employee in the employees array
			[employees addObject:person];
		}
		
		// Create 10 assets
		for (int i = 0; i < 10; i++) {
			
			// Create an asset
			BNRAsset *asset = [[BNRAsset alloc] init];
			
			// Give it an interesting label
			NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
			asset.label = currentLabel;
//        // while the following is a more interesting number, it won't match the book!
//			asset.resaleValue = 350 + i * 17;
			asset.resaleValue = i * 17;
			
			// Get a random number between 0 and 9 inclusive
			NSUInteger randomIndex = random() % [employees count];
			
			// Find that employee
			BNREmployee *randomEmployee = employees[randomIndex];
			
			// Assign the asset to the employee
			[randomEmployee addAsset:asset];
		}
		
		NSLog(@"Employees: %@", employees);
		
		NSLog(@"Giving up ownership of one employee");
		
		[employees removeObjectAtIndex:5];
		
		NSLog(@"Giving up ownership of array");
		
		employees = nil;
	    
	}
    return 0;
}

