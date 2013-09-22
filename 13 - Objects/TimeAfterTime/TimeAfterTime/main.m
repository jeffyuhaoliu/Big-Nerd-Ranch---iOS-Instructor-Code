//
//  main.m
//  TimeAfterTime
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *now = [NSDate date];
        NSLog(@"The new date lives at %p", now);
		NSLog(@"The date is %@", now);
		
		double seconds = [now timeIntervalSince1970];
		NSLog(@"It has been %f seconds since the start of 1970.", seconds);
		
        // these are all bogus and generate errors
//        double testSeconds = [NSDate timeIntervalSince1970];
//        NSDate *testNow = [now date];
//        testSeconds = [now fooIntervalSince1970];
//        testSeconds = [now timeintervalsince1970];
        
    }
    return 0;
}

