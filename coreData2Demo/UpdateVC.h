//
//  UpdateVC.h
//  coreData2Demo
//
//  Created by Brainium on 2/1/16.
//  Copyright © 2016 Brainium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface UpdateVC : UIViewController
@property (strong) NSManagedObject *device;
@property (weak, nonatomic) IBOutlet UITextField *txtupdate;
- (IBAction)updateButton:(id)sender;

@end
