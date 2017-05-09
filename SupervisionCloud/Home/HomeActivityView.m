//
//  HomeActivityView.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "HomeActivityView.h"

#define imageWidth 50
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
  
//    Tag *entity = data;
//    UIImageView *iconImg = [[UIImageView alloc] init];
//    [iconImg setFrame:CGRectMake((self.width - imageWidth)/2, (self.height - imageWidth - 20)/2, imageWidth, imageWidth)];
////    NSString *imageUrl=[GlobalData getAbsolutePath:entity.url inView:iconImg];
//    [iconImg sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"ic_homeTag_def"]];
//    
//    UILabel *label = [[UILabel alloc] init];
//    [label setFrame:CGRectMake(0, iconImg.bottom+10, self.width, 15)];
//    [label setText:entity.name];
//    [label setFont:[UIFont systemFontOfSize:13.f]];
//    [label setTextAlignment:NSTextAlignmentCenter];
//    [label setTextColor:RGB(51, 51, 51)];
//    
//    [self addSubview:iconImg];
//    [self addSubview:label];
//    
//    if (entity.discount.length > 0) {
//        UILabel *tipLabel = [[UILabel alloc] init];
//        [tipLabel setFrame:CGRectMake(iconImg.right-25, iconImg.top-5, 10, 15)];
//        [tipLabel setText:entity.discount];
//        [tipLabel setTextAlignment:NSTextAlignmentCenter];
//        [tipLabel setTextColor:[UIColor whiteColor]];
//        [tipLabel setFont:[UIFont systemFontOfSize:9.f]];
//        [tipLabel setBackgroundColor:TIP_BACKGROUND_COLOR];
//        tipLabel.layer.masksToBounds = YES;
//        tipLabel.layer.cornerRadius = tipLabel.height/2;
//        //        tipLabel.layer.borderColor = [[UIColor whiteColor] CGColor];
//        //        tipLabel.layer.borderWidth = 2.f;
//        [self addSubview:tipLabel];
//        [tipLabel sizeToFit];
//        tipLabel.width += 10;
//        tipLabel.height = 15;
//    }
    
}



@end
