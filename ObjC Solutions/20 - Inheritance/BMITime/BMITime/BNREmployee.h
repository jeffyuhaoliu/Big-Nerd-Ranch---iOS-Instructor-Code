//
//  BNREmployee.h
//  BMITime
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;

- (double)yearsOfEmployment;

@end
