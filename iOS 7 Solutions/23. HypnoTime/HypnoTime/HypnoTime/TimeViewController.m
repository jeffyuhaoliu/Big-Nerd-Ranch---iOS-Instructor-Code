//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Joe Conway on 12/28/12.
//  Copyright (c) 2012 Big Nerd Ranch. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()

@property (nonatomic, weak) IBOutlet UILabel *timeLabel;

@end

@implementation TimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        // Get the tab bar item
        UITabBarItem *tbi = self.tabBarItem;
        // Give it a label
        tbi.title = @"Time";
        
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%@ finished: %d", anim, flag);
}

- (void)spinTimeLabel
{
    // Create a basic animation
    CABasicAnimation *spin =
        [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    spin.delegate = self;
    
    // fromValue is implied
    spin.toValue = @(M_PI * 2.0);
    spin.duration = 1.0;
    
    // Set the timing function
    CAMediaTimingFunction *tf =  [CAMediaTimingFunction
                        functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    spin.timingFunction = tf;
    
    // Kick off the animation by adding it to the layer
    [self.timeLabel.layer addAnimation:spin
                                forKey:@"spinAnimation"];
}

- (void)bounceTimeLabel
{
    // Create a key frame animation
    CAKeyframeAnimation *bounce =
                    [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    // Create the values it will pass through
    CATransform3D forward = CATransform3DMakeScale(1.3, 1.3, 1);
    CATransform3D back = CATransform3DMakeScale(0.7, 0.7, 1);
    CATransform3D forward2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D back2 = CATransform3DMakeScale(0.9, 0.9, 1);
    bounce.values = @[
                        [NSValue valueWithCATransform3D:CATransform3DIdentity],
                        [NSValue valueWithCATransform3D:forward],
                        [NSValue valueWithCATransform3D:back],
                        [NSValue valueWithCATransform3D:forward2],
                        [NSValue valueWithCATransform3D:back2],
                        [NSValue valueWithCATransform3D:CATransform3DIdentity]
                    ];
    // Set the duration
    bounce.duration = 0.6;
    // Animate the layer
    [self.timeLabel.layer addAnimation:bounce
                                forKey:@"bounceAnimation"];
}

- (IBAction)showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeStyle = NSDateFormatterMediumStyle;
    self.timeLabel.text = [formatter stringFromDate:now];
    
//    [self spinTimeLabel];
    [self bounceTimeLabel];
}

@end
