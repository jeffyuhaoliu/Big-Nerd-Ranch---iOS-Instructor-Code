//
//  main.m
//  NSString
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
		NSString *lament = @"Why me?!";
		NSLog(@"%@", lament);
        
		NSString *slogan = @"I \u2661 New York!";
		NSLog(@"%@", slogan);
        
        NSString *dateString = [NSString stringWithFormat:@"The date is %@", [NSDate date]];
		NSLog(@"%@", dateString);
        
        NSUInteger charCount = [dateString length];
		NSLog(@"The string \"%@\" is %lu characters long", dateString, charCount);

        NSString *str1 = @"Teech";
        NSString *str2 = [NSString stringWithFormat:@"%@%@", @"Te", @"ech"];
        
        // this is efficient, but usually not the test you intend
        if (str1 == str2) {
            NSLog(@"The strings \"%@\" and \"%@\" are identical!", str1, str2);
        }
        
        // this is usually what you're after...
        if ([str1 isEqualToString: str2]) {
            NSLog(@"However, they have equal value (same characters)");
        }

        NSString *angryText = @"That makes me so mad!";
        NSLog(@"Caps-lock is really loud: %@", [angryText uppercaseString]);

    }
    return 0;
}

