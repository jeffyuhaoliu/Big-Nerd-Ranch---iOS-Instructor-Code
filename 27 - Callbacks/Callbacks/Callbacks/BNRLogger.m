//
//  BNRLogger.m
//  Callbacks
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger
{
    NSMutableData *_incomingData;
}
#pragma mark - Timer

-(NSString *)lastTimeString
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        NSLog(@"created dateFormatter");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    self.lastTime = now;
    NSLog(@"Just set the time to %@", self.lastTimeString);
}

#pragma mark - NSURLConnection Delegate

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
	NSLog(@"received %lu bytes", [data length]);
	
	if (! _incomingData) {
		_incomingData = [[NSMutableData alloc] init];
	}
	
	[_incomingData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSLog(@"Got it all!");
	NSString *string = [[NSString alloc] initWithData:_incomingData
                                             encoding:NSUTF8StringEncoding];
	_incomingData = nil;
	NSLog(@"string has %lu characters", [string length]);
	
	// Uncomment the next line to see the entire fetched string
	// NSLog(@"The whole string is %@", string);
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
	NSLog(@"connection failed: %@", [error localizedDescription]);
	_incomingData = nil;
}

#pragma mark - NSNotificationCenter Notifications

- (void)zoneChange:(NSNotification *)note
{
	NSLog(@"The system time zone has changed!");
}

#pragma mark - Destruction

- (void)dealloc
{
	// Un-register with the notification center
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
