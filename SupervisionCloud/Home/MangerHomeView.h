//
//  MangerHomeView.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Banner.h"

@interface MangerHomeView : UIView

@property (nonatomic, retain) IBOutlet UILabel *planL;
@property (nonatomic, retain) IBOutlet UILabel *contractNumL;
@property (nonatomic, retain) IBOutlet UILabel *startTimeL;
@property (nonatomic, retain) IBOutlet UILabel *dynamicTL;
@property (nonatomic, retain) IBOutlet UILabel *dynamicML;

@property (nonatomic,strong)NSArray *projectArr;


-(void)createAllMenuData:(NSArray *)list;
-(void)setBannerInfo:(Banner *)item;
-(void)setActivtiyViews:(NSArray *)list;
-(void)creatDropMenu;
- (void)setupTableView;

@end
