//
//  MineHeaderCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "MineHeaderCell.h"
#import "UserInfoBody.h"
#import "UITableViewCell+SMKConfigure.h"

@interface MineHeaderCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImg;

@end

@implementation MineHeaderCell
- (void) drawRect:(CGRect)rect{
    _headerImg.layer.cornerRadius = _headerImg.frame.size.height/2;
    _headerImg.layer.masksToBounds = YES;
    

}
- (void)smk_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
    UserInfoBody *user = (UserInfoBody *)model;
    self.nameLabel.text = user.nickname ;
    //TODO:icon
    self.headerImg.image = [UIImage imageNamed:@"xxx"];
    
    
}

@end

