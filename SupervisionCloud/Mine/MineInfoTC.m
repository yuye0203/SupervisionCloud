//
//  MineInfoTC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "MineInfoTC.h"
#import "MineTableViewModel.h"
#import "UserInfoManger.h"
#import "UserInfoBody.h"
#import "UIImageView+WebCache.h"

@interface MineInfoTC ()

@property (nonatomic, weak) IBOutlet UILabel *nickNameL;
@property (nonatomic, weak) IBOutlet UILabel *roleL;
@property (nonatomic, weak) IBOutlet UILabel *mobileL;
@property (nonatomic, weak) IBOutlet UILabel *emailL;
@property (nonatomic, weak) IBOutlet UISwitch *notice;
@property (nonatomic, weak) IBOutlet UIImageView *head;

@property (nonatomic, strong) MineTableViewModel *mainTableViewModel;

@end

@implementation MineInfoTC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUserInfo];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (MineTableViewModel *)mainTableViewModel {
    if (_mainTableViewModel == nil) {
        _mainTableViewModel = [[MineTableViewModel alloc]init];
    }
    return _mainTableViewModel;
}
-(void)setUserInfo{
    
    UserInfoBody *model = [UserInfoManger getInfo];
    
    _nickNameL.text = model.nickname;
    _roleL.text = model.role;
    _mobileL.text = model.mobile;
    _emailL.text =model.email;
    _notice.on = model.openNotice==0?NO:YES;
    
    [_head sd_setImageWithURL:[NSURL URLWithString:model.headPortrait] placeholderImage:[UIImage imageNamed:@"touxia_def"]];
    _head.layer.masksToBounds = YES;
    _head.layer.cornerRadius = CGRectGetWidth(_head.frame)/2;
}

@end
