//
//  KBMListHeaderView.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/3.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "KBMListHeaderView.h"
#import "UIView+SMKEvents.h"
#import "UIView+Frame.h"

#define ScreenW ([UIScreen mainScreen].bounds.size.width)
#define ScreenH ([UIScreen mainScreen].bounds.size.height)
#define ScreenB ([UIScreen mainScreen].bounds)

@interface KBMListHeaderView ()

/** label */
@property (nonatomic, weak) UILabel *label;

@end

@implementation KBMListHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc] init];
        
        label.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        label.fX = 16;
        label.fWidth = ScreenW - 2 * 16;

        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:16.0];
        
        self.label = label;
        [self.contentView addSubview:label];
        
        UIImageView *arr = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_more_right"]];
        arr.frame = CGRectMake(0, 0, 8, 15);

        arr.fX = ScreenW - 2 * 16;
        arr.fY = 50.f/2.f - 7.5;
        
        [self.contentView addSubview:arr];

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.autoresizingMask = UIViewAutoresizingFlexibleHeight;

        btn.fX = 0;
        btn.fWidth = ScreenW;
      
        //TODO:btn 点击事件
       
        [btn addTarget:self action:@selector(showlog) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];

    }
    
    return self;
    
}

- (void)setTitle:(NSString *)title {
    
    // copy属性,我们我们就调用copy方法
    _title = [title copy];
    
    self.label.text = title;
    
}
-(void)showlog{
    
    if (self.moreBtnPress) {
        self.moreBtnPress();
    }
}


@end
