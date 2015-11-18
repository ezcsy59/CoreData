//
//  MasterViewController.m
//  CoreData
//
//  Created by Human on 15/11/7.
//  Copyright (c) 2015年 Human. All rights reserved.
//

#import "MasterViewController.h"
#import <CoreData/CoreData.h>
#import "Info.h"
#import "AppDelegate.h"
@interface MasterViewController ()
@property (nonatomic,retain)NSArray *Infos;
@end

@implementation MasterViewController


@synthesize managedObjectContext;
- (void)viewDidLoad {
    [super viewDidLoad];

    
//    AppDelegate *app=[[UIApplication sharedApplication] delegate];
    self.Infos=[Info findAllWithPredicate:[NSPredicate predicateWithFormat:@"name =='陈思' OR city =='广州'"]];
//    for(int i=0;i<_Infos.count;i++){
//        
//        Info *info=_Infos[i];
//        if([info.name isEqualToString:@"陈思宇"])
//        {
//            info.city=@"广州";
//            info.site=@"金沙洲";
//            
//        }
//        
//        
//        
//    }
//    
//    [self saveContext];
    
//    managedObjectContext=[app managedObjectContext];
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Info" inManagedObjectContext:managedObjectContext];
//    [fetchRequest setEntity:entity];
//    NSError *error;
//    self.Infos = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
//    self.title = @"Failed Banks";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)saveContext {
    
    //save the entity to core ddata.
    [[NSManagedObjectContext defaultContext]saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if(success){
            NSLog(@"you successfully saved your context");
        }else if(error){
            NSLog(@"error saving context:%@",error.description);
        }
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_Infos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    Info *info = [_Infos objectAtIndex:indexPath.row];
    cell.textLabel.text = info.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@",
                                 info.city, info.site];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
