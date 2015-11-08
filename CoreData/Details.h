//
//  Details.h
//  CoreData
//
//  Created by Human on 15/11/7.
//  Copyright (c) 2015年 Human. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Info;

@interface Details : NSManagedObject

@property (nonatomic, retain) NSNumber * zip;
@property (nonatomic, retain) NSDate * closeDate;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) Info *info;

@end
