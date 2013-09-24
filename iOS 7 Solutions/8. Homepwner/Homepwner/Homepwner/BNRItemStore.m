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

- (BNRItem *)createItem
{
    BNRItem *p = [BNRItem randomItem];
    
    [self.privateItems addObject:p];
    
    return p;
}

@end
