//
//  SVCloudImageCollectionCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/9.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "SVCloudImageCollectionCell.h"

@implementation SVCloudImageCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
/** 查看大图 */
- (void)setBigImageViewWithImage:(UIImage *)img{
    if (_BigImageView) {
        //如果大图正在显示，还原小图
        _BigImageView.frame = _profilePhoto.frame;
        _BigImageView.image = img;
    }else{
        _BigImageView = [[UIImageView alloc] initWithImage:img];
        _BigImageView.frame = _profilePhoto.frame;
        [self insertSubview:_BigImageView atIndex:0];
    }
    _BigImageView.contentMode = UIViewContentModeScaleToFill;
}

@end
