//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Christian Keur on 6/26/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        self.tabBarItem.title = @"Hypnosis";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno"];
    }
    
    return self;
}

- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    // Set it as *the* view of this view controller
    
    self.view = v;
}

@end
