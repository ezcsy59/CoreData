//
//  Info.h
//  CoreData
//
//  Created by Human on 15/11/7.
//  Copyright (c) 2015年 Human. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Details;

@interface Info : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * site;
@property (nonatomic, retain) Details *details;

@end
