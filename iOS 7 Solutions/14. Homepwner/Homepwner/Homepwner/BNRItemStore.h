//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Matthew D. Mathias on 6/25/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject

// Notice that this is a class method and prefixed with a + instead of a -
+ (BNRItemStore *)sharedStore;

@property (nonatomic, strong, readonly) NSArray *allItems;

- (void)removeItem:(BNRItem *)p;
- (void)moveItemAtIndex:(int)from toIndex:(int)to;
- (BNRItem *)createItem;
- (BOOL)saveChanges;

@end
