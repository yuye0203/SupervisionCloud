//
//  MainTabVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/6.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "MainTabVC.h"
#import "LoginVC.h"
#import "UserInfoManager.h"

@interface MainTabVC ()

@end

@implementation MainTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    if (![UserInfoManager isLogin]) {
        [self performSegueWithIdentifier:@"ShowLogin" sender:nil];
    }
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowLogin"])
    {
        NSLog(@"11111");
//        DetailViewController *detailViewController = [segue destinationViewController];
//        detailViewController.sighting = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
