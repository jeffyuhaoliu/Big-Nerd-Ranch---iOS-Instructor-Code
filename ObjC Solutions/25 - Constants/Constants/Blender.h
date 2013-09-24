//
//  Blender.h
//  Constants
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef enum {
//	BlenderSpeedStir = 1,
//	BlenderSpeedChop = 2,
//	BlenderSpeedLiquify = 5,
//	BlenderSpeedPulse = 9,
//	BlenderSpeedCrush = 15
//} BlenderSpeed;

// More efficient 
typedef NS_ENUM(char, BlenderSpeed) {
	BlenderSpeedStir = 1,
	BlenderSpeedChop = 2,
	BlenderSpeedLiquify = 5,
	BlenderSpeedPulse = 9,
	BlenderSpeedCrush = 15
};

@interface Blender : NSObject

// speed must be one of the five speeds
@property BlenderSpeed speed;



@end
