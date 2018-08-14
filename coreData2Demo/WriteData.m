//
//  WriteData.m
//  coreData2Demo
//
//  Created by Brainium on 2/1/16.
//  Copyright © 2016 Brainium. All rights reserved.
//

#import "WriteData.h"

@interface WriteData ()
@property (weak, nonatomic) IBOutlet UITextField *txtname;
- (IBAction)saveButton:(id)sender;

@end

@implementation WriteData
//@synthesize device;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButton:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
//    if (self.device) {
//        // Update existing device
//        [self.device setValue:self.txtname.text forKey:@"name"];
//        
//    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        [newDevice setValue:self.txtname.text forKey:@"name"];
  //  }
    
//    NSError *error = nil;
//    // Save the object to persistent store
//    if (![context save:&error]) {
//        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
//    }
    
    [self.navigationController popViewControllerAnimated:YES];

}
@end
