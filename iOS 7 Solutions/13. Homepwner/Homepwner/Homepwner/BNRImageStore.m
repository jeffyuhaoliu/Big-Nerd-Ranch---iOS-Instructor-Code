//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Matthew D. Mathias on 6/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedStore];
}

+ (BNRImageStore *)sharedStore
{
    static BNRImageStore *sharedStore = nil;
    if (!sharedStore) {
        // Create the singleton
        sharedStore = [[super allocWithZone:NULL] init];
    }
    return sharedStore;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setImage:(UIImage *)i forKey:(NSString *)s
{
    self.dictionary[s] = i;
}

- (UIImage *)imageForKey:(NSString *)s
{
    return self.dictionary[s];
}

- (void)deleteImageForKey:(NSString *)s
{
    if (!s)
        return;
    [self.dictionary removeObjectForKey:s];
}

@end
