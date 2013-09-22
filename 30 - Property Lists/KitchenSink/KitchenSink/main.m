//
//  main.m
//  KitchenSink
//
//  Created by Teech on 9/21/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
	@autoreleasepool {
	    
		// Array to hold everything that will go into the Property List file
		NSMutableArray *pList = [[NSMutableArray alloc] init];
		
		// Array to go into the property list
		NSArray *mohs = @[@"Talc", @"Gypsum", @"Calcite", @"Fluorite", @"Apatite", @"Feldspar", @"Quartz", @"Topaz", @"Corundum", @"Diamond"];
		[pList addObject:mohs];
		
		// Dictionary to go into the property list
		NSDictionary *collection = @{ @"name" : @"Rutile",
                                             @"formula" : @"TiO2" };
		[pList addObject:collection];
		
		// String to go into the property list
		[pList addObject:@"Mineral Madness!"];
		
		// Data added to the property list
        [pList addObject:[NSKeyedArchiver archivedDataWithRootObject:collection]];
		
		// Date added to the property list
		[pList addObject:[NSDate date]];
		
		// Integer added to the property list
		[pList addObject:@42];
		
		// Float added to the property list
		[pList addObject:@3.14159];
		
		// Boolean added to the property list
		[pList addObject:@YES];
		
		// Save the pList
		[pList writeToFile:@"/tmp/kitchen-sink.plist" atomically:YES];
 	    
	}
    return 0;
}

