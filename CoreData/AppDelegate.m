//
//  AppDelegate.m
//  CoreData
//
//  Created by Human on 15/11/6.
//  Copyright (c) 2015年 Human. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSArray *Infos;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
//    MasterViewController *controller = (MasterViewController *)navigationController.topViewController;
//    controller.managedObjectContext = self.managedObjectContext;
    
    
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    for (int i=0; i<2; i++) {
//   Info *failedBankInfo = [NSEntityDescription insertNewObjectForEntityForName:@"Info"
//                                                                                                                                   inManagedObjectContext:context];
//    
//    
//    [failedBankInfo setValue:[NSString stringWithFormat:@"测试新型"] forKey:@"name"];
//    [failedBankInfo setValue:@"T广州" forKey:@"city"];
//    [failedBankInfo setValue:@"市区" forKey:@"site"];
//    
//    NSManagedObject *failedBankDetails = [NSEntityDescription insertNewObjectForEntityForName:@"Details"
//                                                                                                                              inManagedObjectContext:context];
//    [failedBankDetails setValue:[NSDate date] forKey:@"closeDate"];
//    [failedBankDetails setValue:[NSDate date] forKey:@"updateDate"];
//    [failedBankDetails setValue:[NSNumber numberWithInt:12345] forKey:@"zip"];
//    [failedBankDetails setValue:failedBankInfo forKey:@"info"];
//    [failedBankInfo setValue:failedBankDetails forKey:@"details"];
//    
//        
//        NSError *error ;
//        if (![context save:&error]) {
//            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
//        }
//        
//    }
    
    
    
    
    
//   NSError *error ;
//    if (![context save:&error]) {
//        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
//    }
//
    
//    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Info" inManagedObjectContext:context];
//    [fetchRequest setEntity:entity];
//    
//    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
//   
//    NSLog(@"数据量%lu", (unsigned long)fetchedObjects.count);
//    for (int i=0;i<fetchedObjects.count;i++) {
////        NSLog(@"Name: %@", info.name);
////        Details *details = info.details;
////        NSLog(@"Zip: %@", details.zip);
//        
////        
////        info.name=@"彩铃";
////        info.city=@"我爱你";
//        
//        [context deleteObject:fetchedObjects[i]];
//        
//        if ([context save:&error]) {
//            //更新成功
//            NSLog(@"删除成功");
//        }
//    }

       [MagicalRecord setupCoreDataStackWithStoreNamed:@"CoreData.sqlite"];
//    Info *i=[Info createEntity];
//    i.name=@"陈思宇";
//     [[NSManagedObjectContext defaultContext] saveToPersistentStoreWithCompletion:nil];
    
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController=[MasterViewController new];
    [self.window makeKeyAndVisible];
    
    
    NSLog(@"沙盒路径%@",NSHomeDirectory());
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "human.CoreData" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreData.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
