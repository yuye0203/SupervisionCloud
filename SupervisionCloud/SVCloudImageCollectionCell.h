//
//  SVCloudImageCollectionCell.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/9.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SVCloudImageCollectionCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *profilePhoto;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;

@property(nonatomic,strong) UIImageView *BigImageView;

/** 查看大图 */
- (void)setBigImageViewWithImage:(UIImage *)image;

@end
