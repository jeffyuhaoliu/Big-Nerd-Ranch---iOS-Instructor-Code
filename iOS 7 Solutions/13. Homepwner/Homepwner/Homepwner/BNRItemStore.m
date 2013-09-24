//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Matthew D. Mathias on 6/25/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic, strong) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

- (NSArray *)allItems
{
    return _privateItems;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (BNRItemStore *)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];
    
    return sharedStore;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedStore];
}

- (void)removeItem:(BNRItem *)p
{
    [self.privateItems removeObjectIdenticalTo:p];
}

- (void)moveItemAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    // Get pointer to object being moved so we can re-insert it
    BNRItem *p = self.privateItems[from];
    
    // Remove p from the array
    [self.privateItems removeObjectAtIndex:from];
    
    // Insert p in the array at new location
    [self.privateItems insertObject:p atIndex:to];
}

- (BNRItem *)createItem
{
    BNRItem *p = [BNRItem randomItem];
    
    [self.privateItems addObject:p];
    
    return p;
}

@end
