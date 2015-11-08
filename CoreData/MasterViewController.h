//
//  MasterViewController.h
//  CoreData
//
//  Created by Human on 15/11/7.
//  Copyright (c) 2015年 Human. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@end
