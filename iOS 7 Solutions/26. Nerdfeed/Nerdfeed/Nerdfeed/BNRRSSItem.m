//
//  BNRRSSItem.m
//  Nerdfeed
//
//  Created by Joe Conway on 2/25/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "BNRRSSItem.h"

@implementation BNRRSSItem

- (void)readFromJSONObject:(NSDictionary *)jsonObject
{
    NSDictionary *name = jsonObject[@"im:name"];
    self.title = name[@"label"];
    // The link to the preview audio sample is buried deep in the JSON
    NSArray *linkArray = jsonObject[@"link"];
    for(NSDictionary *d in linkArray) {
        NSDictionary *attrs = d[@"attributes"];
        if([attrs[@"im:assetType"] isEqualToString:@"preview"]) {
            NSDictionary *attrs = d[@"attributes"];
            self.link = attrs[@"href"];
        }
    }
}

@end
