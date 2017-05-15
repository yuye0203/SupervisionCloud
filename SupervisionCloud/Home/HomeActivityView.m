//
//  HomeActivityView.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "HomeActivityView.h"
#import "FunctionItem.h"
#import "UIViewAdditions.h"
#import "UIImageView+WebCache.h"

#define imageWidth 20
#define dotWidth 7

@implementation HomeActivityView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (id)initWithFrame:(CGRect)frame data:(id)data
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createActivityView:data];
    }
    return self;
}

- (void)createActivityView:(id)data{
  
    FunctionItem *entity = data;
    UIImageView *iconImg = [[UIImageView alloc] init];
    
    [iconImg setFrame:CGRectMake((self.width - imageWidth)/2, (self.height - imageWidth - 20)/2, imageWidth, imageWidth)];
    [iconImg sd_setImageWithURL:[NSURL URLWithString:entity.img] placeholderImage:[UIImage imageNamed:@"ic_homeTag_def"]];
    [iconImg setContentMode:UIViewContentModeScaleAspectFit];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(0, iconImg.bottom+10, self.width, 15)];
    [label setText:entity.name];
    [label setFont:[UIFont systemFontOfSize:13.f]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor darkTextColor]];;
    
    [self addSubview:iconImg];
    [self addSubview:label];
    
    if(entity.notice==1){
        UIImageView *noticeImg = [[UIImageView alloc] init];
        [noticeImg setFrame:CGRectMake((self.width )/2+dotWidth, (self.height - imageWidth - 20)/2, dotWidth, dotWidth)];
        [noticeImg setImage:[UIImage imageNamed:@"project_icon_messagetixing"]];

        [self addSubview:noticeImg];

    }
    
}



@end
