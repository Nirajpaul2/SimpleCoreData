//
//  UpdateVC.m
//  coreData2Demo
//
//  Created by Brainium on 2/1/16.
//  Copyright © 2016 Brainium. All rights reserved.
//

#import "UpdateVC.h"

@interface UpdateVC ()

@end

@implementation UpdateVC

- (void)viewDidLoad {
    [super viewDidLoad];
      [self.txtupdate setText:[self.device valueForKey:@"name"]];
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

- (IBAction)updateButton:(id)sender {
     [self.device setValue:self.txtupdate.text forKey:@"name"];

    [self.navigationController popViewControllerAnimated:YES];
}
@end
