//
//  main.m
//  VowelMovement
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
		// Create array of strings to devowelize and a container for devowelized ones
		NSArray *oldStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
		NSLog(@"old strings: %@", oldStrings);
		NSMutableArray *newStrings = [NSMutableArray array];
		
		// Create a list of characters that we'll remove from the string
		NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
	    
		// Declare the block variable
//		void (^devowelizer)(id, NSUInteger, BOOL *);
        
        ArrayEnumerationBlock devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            
			NSRange yRange = [string rangeOfString:@"y"
										   options:NSCaseInsensitiveSearch];
			
			// Did I find a y?
			if (yRange.location != NSNotFound) {
				*stop = YES;	// prevent further iterations
				return;			// stop this iteration
			}
			
			NSMutableString *newString = [NSMutableString stringWithString:string];
			
			// Iterate over the array of vowels, replacing occurences of each with an empty string
			for (NSString *s in vowels) {
				NSRange fullRange = NSMakeRange(0, [newString length]);
				[newString replaceOccurrencesOfString:s
										   withString:@""
											  options:NSCaseInsensitiveSearch
												range:fullRange];
			}
			[newStrings addObject:newString];
			
		};	// end of block assignment
        
        // Iterate over the array with our block
		[oldStrings enumerateObjectsUsingBlock:devowelizer];
		NSLog(@"new strings: %@", newStrings);

    }
    return 0;
}

