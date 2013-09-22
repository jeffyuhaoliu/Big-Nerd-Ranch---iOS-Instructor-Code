//
//  main.m
//  Stockz
//
//  Created by Teech on 9/21/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
	    
		NSMutableArray *stocks = [[NSMutableArray alloc] init];
		
		NSDictionary *stock;
		
		stock = @{@"symbol" : @"AAPL",
                  @"shares" : @200 };
		[stocks addObject:stock];
        
        stock = @{@"symbol" : @"GOOG",
                  @"shares" : @160 };
		[stocks addObject:stock];
        
		[stocks writeToFile:@"/tmp/stocks.plist"
                 atomically:YES];
		
		NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
		for (NSDictionary *d in stockList) {
			NSLog(@"I have %@ shares of %@",
				  [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
		}
	    
	}
    return 0;
}

