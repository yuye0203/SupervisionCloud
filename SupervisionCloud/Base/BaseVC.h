//
//  BaseVC.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/3.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>

#define sWeakSelf typeof(self) __weak weakSelf = self;

@interface BaseVC : UIViewController

-(NSDictionary *)parametersWithDic:(NSMutableDictionary *)mdic;

@end
