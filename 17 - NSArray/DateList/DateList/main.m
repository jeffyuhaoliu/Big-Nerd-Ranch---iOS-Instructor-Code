//
//  main.m
//  DateList
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
		// Create three NSDate objects
		NSDate *now = [NSDate date];
		NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
		NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
		
//		// Create an array containing all three (nil terminates the list)
//		NSArray *dateList = @[now, tomorrow, yesterday];
//        
//		// Print a couple of dates
//		NSLog(@"The first date is %@", dateList[0]);
//		NSLog(@"The third date is %@", dateList[2]);
//        
//        // How many dates are there?
//		NSLog(@"There are %lu dates", [dateList count]);
//        
////        NSLog(@"The fourth date is %@", dateList[3]);   // Crash!
//		
//        // Iterate over the array - explicit "for" loop
//		NSUInteger dateCount = [dateList count];
//		for (int i = 0; i < dateCount; i++) {
//			NSDate *d = dateList[i];
//			NSLog(@"Here is a date: %@", d);
//		}
      
        // Create an empty mutable array instead
		NSMutableArray *dateList = [NSMutableArray array];
        
        // Add the dates to the array
		[dateList addObject:now];
		[dateList addObject:tomorrow];
		
		// Put yesterday at the beginning of the array
		[dateList insertObject:yesterday
                       atIndex:0];

        // Fast enumeration
        for (NSDate *d in dateList) {
			NSLog(@"Here is a date: %@", d);
		}

		// Remove yesterday
		[dateList removeObjectAtIndex:0];
		NSLog(@"Now the first date is %@", dateList[0]);

    }
    return 0;
}

