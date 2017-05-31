//
//  DocumentListCell.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/25.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocumentListCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressV;


@end
