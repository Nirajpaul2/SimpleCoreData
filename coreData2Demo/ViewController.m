//
//  ViewController.m
//  coreData2Demo
//
//  Created by Brainium on 2/1/16.
//  Copyright © 2016 Brainium. All rights reserved.
//

#import "ViewController.h"
#import "WriteData.h"
#import "UpdateVC.h"
#import "checkoutpage.h"
@interface ViewController ()
- (IBAction)inputButton:(id)sender;
@property (strong) NSMutableArray *devices;
@property (weak, nonatomic) IBOutlet UITableView *tblvdataStore;
- (IBAction)checkoutbutton:(id)sender;

@end

@implementation ViewController
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    [self.tblvdataStore reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputButton:(id)sender {
    
    WriteData *segue = (WriteData *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"WriteData"];
    [self.navigationController pushViewController:segue animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell==0) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    // Configure the cell...
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
    cell.textLabel.text =[NSString stringWithFormat:@"%@",[device valueForKey:@"name"]];
    
    //[cell.textLabel setText:[NSString stringWithFormat:@"%@",[device valueForKey:@"name"]]];
   // [cell.detailTextLabel setText:[device valueForKey:@"company"]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        //[context deleteObject:[self.devices objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        
        
        // Remove device from table view
        [self.devices removeObjectAtIndex:indexPath.row];
        [self.tblvdataStore deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
  NSManagedObject *selectedDevice = [self.devices objectAtIndex:[[_tblvdataStore indexPathForSelectedRow] row]];
    UpdateVC *segue =(UpdateVC *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"UpdateVC"];
    segue.device =selectedDevice;
    
    [self.navigationController pushViewController:segue animated:YES];
}


- (IBAction)checkoutbutton:(id)sender {
    
    checkoutpage *segure = (checkoutpage *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"checkoutpage"];
    [self.navigationController pushViewController:segure animated:YES];
}
@end
