//
//  KnowledgeDetailVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/16.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "KnowledgeDetailVC.h"
#import "KnowledgeDetailVModel.h"
#import "KnowledgeModel.h"
#import "UIImageView+WebCache.h"

@interface KnowledgeDetailVC ()
@property (nonatomic, strong) KnowledgeDetailVModel *viewModel;
@property(nonatomic,weak)IBOutlet UILabel  *titleL;
@property(nonatomic,weak)IBOutlet UILabel  *nameL;
@property(nonatomic,weak)IBOutlet UIButton  *zanBtn;
@property(nonatomic,weak)IBOutlet UILabel  *timeL;
@property(nonatomic,weak)IBOutlet UIImageView  *iconImage;
@property(nonatomic,weak)IBOutlet UIImageView  *bigImage;
@property(nonatomic,weak)IBOutlet UILabel  *desL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bigHeight;

@end

@implementation KnowledgeDetailVC
-(KnowledgeDetailVModel *)viewModel{
    if (_viewModel==nil) {
        _viewModel = [[KnowledgeDetailVModel alloc] init];
    }
    return _viewModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getDetailInfo];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getDetailInfo{
    sWeakSelf
    
    [self.viewModel getDetailInfo: self.idField
                CompletionHandle:^(BOOL success, NSError *error,id result){
                    if (success) {
                        KnowledgeModel *item = (KnowledgeModel *)result;
                        weakSelf.titleL.text = item.title;
                        weakSelf.nameL.text = item.author;
                        [weakSelf.zanBtn setTitle:[NSString stringWithFormat:@"%ld" ,item.praiseNum] forState:UIControlStateNormal];
                        [weakSelf.iconImage sd_setImageWithURL:[NSURL URLWithString:item.imgUrl] placeholderImage:[UIImage imageNamed:@"img_default"]];
                        if(item.imgUrl.length>0){
                            [weakSelf.bigImage sd_setImageWithURL:[NSURL URLWithString:item.imgUrl] placeholderImage:[UIImage imageNamed:@"img_default"]];
                            self.bigHeight.constant = 150.f;

                            
                        }else
                            self.bigHeight.constant = 0.f;

                        weakSelf.desL.text = item.desc;

                    }
                }] ;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)zanAction:(id)sender{
//TODO:点赞
}
@end
