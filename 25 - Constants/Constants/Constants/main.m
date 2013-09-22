//
//  main.m
//  Constants
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
		NSLog(@"\u03c0 is %f", M_PI);
		NSLog(@"%d is larger", MAX(10,12));
		
		NSLocale *here = [NSLocale currentLocale];
		NSString *currency = [here objectForKey:NSLocaleCurrencyCode];
		NSLog(@"Money is %@", currency);
        
    }
    return 0;
}

