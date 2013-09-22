//
//  main.m
//  Stringz
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
	    
		// Writing NSString to a file
		NSMutableString *str = [[NSMutableString alloc] init];
		for (int i=0; i<10; i++) {
			[str appendString:@"Aaron is cool!\n"];
		}
		
		[str writeToFile:@"/tmp/cool.txt"
			  atomically:YES
				encoding:NSUTF8StringEncoding
				   error:NULL];
		NSLog(@"done writing /tmp/cool.txt");
		
		// Declare a pointer to an NSError object, but don't instantiate it
        // The NSError instance will only be created if there is, in fact, an error.
		NSError *error = nil;
		BOOL success = [str writeToFile:@"/tmp/cool.txt"
							 atomically:YES
							   encoding:NSUTF8StringEncoding
								  error:&error];
		if (success) {
			NSLog(@"done writing /tmp/cool.txt");
		} else {
			NSLog(@"writing /tmp/cool.txt failed: %@", [error localizedDescription]);
		}
		
		NSString *resolve = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
															encoding:NSASCIIStringEncoding error:&error];
		if (!resolve) {
			NSLog(@"read failed: %@", [error localizedDescription]);
		} else {
			NSLog(@"resolv.conf looks like this: %@", resolve);
		}
		
		NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		NSData *data = [NSURLConnection sendSynchronousRequest:request
											 returningResponse:NULL
														 error:&error];
		
		if (! data) {
			NSLog(@"fetch failed: %@", [error localizedDescription]);
			return 1;
		}
		
		NSLog(@"The file is %lu bytes", [data length]);
		
		BOOL written = [data writeToFile:@"/tmp/google.png"
								 options:0
								   error:&error];
		
		if (! written) {
			NSLog(@"write failed: %@", [error localizedDescription]);
			return 1;
		}
		
		NSLog(@"Success!");
		
		NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
		NSLog(@"The file read from the disk has %lu bytes", (unsigned long)[readData length]);
	    
	}
    return 0;
}

