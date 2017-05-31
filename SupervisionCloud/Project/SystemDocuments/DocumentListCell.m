//
//  DocumentListCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/25.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "DocumentListCell.h"
#import "DocumentsItem.h"


@implementation DocumentListCell

- (void)smk_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
  
    DocumentsItem *item = (DocumentsItem *)model;
    self.nameLabel.text = item.type ;
    self.numberLabel.text = [NSString stringWithFormat:@"%@/%@",item.needCheckNum,item.num];

    //TODO:icon
    self.iconImg.image = [UIImage imageNamed:@"xxx"];
    
    [self.progressV setProgress:[item.needCheckNum floatValue]/[item.num floatValue]];
}

@end

