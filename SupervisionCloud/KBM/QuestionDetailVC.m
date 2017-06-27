//
//  QuestionDetailVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/6/1.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "QuestionDetailVC.h"
#import "QuestionDetailVM.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "SVProgressHUD.h"

@interface QuestionDetailVC ()<UITextViewDelegate>{
    BOOL _keyboardIsVisible;
}
@property (nonatomic, strong) QuestionDetailVM *sviewModel;
@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic,weak) IBOutlet UIButton *hidBtn;
@property (nonatomic,weak) IBOutlet TPKeyboardAvoidingScrollView *answerView;
@property (nonatomic,weak) IBOutlet UITextView *answerTextView;
@property (nonatomic,weak) IBOutlet UILabel *pLabel;
@property (weak,nonatomic) IBOutlet NSLayoutConstraint *viewHeight;
@property (nonatomic,weak) IBOutlet UIView *answerBV;

@end

@implementation QuestionDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageIndex = 1;
    [self setupTableView];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center  addObserver:self selector:@selector(keyboardDidShow)  name:UIKeyboardDidShowNotification  object:nil];
    [center addObserver:self selector:@selector(keyboardDidHide)  name:UIKeyboardWillHideNotification object:nil];
    _keyboardIsVisible = NO;
    CGSize size_screen = [[UIScreen mainScreen] bounds].size;
    
    self.viewHeight.constant = size_screen.height-64;;

    _answerBV.layer.shadowColor = [UIColor blackColor].CGColor;
    _answerBV.layer.shadowOffset = CGSizeMake(4,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    _answerBV.layer.shadowOpacity = 0.4;//阴影透明度，默认0
    _answerBV.layer.shadowRadius = 2;//阴影半径，默认3

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(QuestionDetailVM *)sviewModel{
    if (_sviewModel==nil) {
        _sviewModel = [[QuestionDetailVM alloc] init];
    }
    return _sviewModel;
}
- (void)setupTableView
{
    sWeakSelf
    
    self.sviewModel.idField = self.idField;
    [self.sviewModel handleWithTable:self.table head:^{
        
        [weakSelf.sviewModel getDetailInfo:self.idField CompletionHandle:^(BOOL success, NSError *error, id result) {
            if (success) {
                [self.table reloadData];
            }
        }];
       [weakSelf.sviewModel getListData:^(BOOL success, NSError *error, id result) {
           if (success) {
               _pageIndex++;
               [weakSelf.sviewModel setDataArrayList:result];
               [self.table reloadData];
           }
           
       }];
        
    } foot:^{
        [weakSelf.sviewModel getMoreData:_pageIndex completionHandle:^(BOOL success, NSError *error, id result) {
            [weakSelf.sviewModel setMoreDataWithModelArray:result completion:^{
                if (success) {
                    [weakSelf.sviewModel setMoreDataWithModelArray:^NSArray *{
                        return (NSArray *)result;
                    } completion:^{
                        [weakSelf.table reloadData];
                    }];
                }
            }];

        }];
    }];
    
}

#pragma Action
-(IBAction)gotoAsk:(id)sender{
    _hidBtn.hidden = NO;
    _answerView.hidden = NO;
}
-(IBAction)hideTextView:(id)sender{
    if (_keyboardIsVisible ) {
        [self.view endEditing:YES];

    }else{
        _hidBtn.hidden = YES;
        _answerView.hidden = YES;

    }

}
-(IBAction)saveAction:(id)sender{
    
    if (_answerTextView.text.length<10) {
        [SVProgressHUD showErrorWithStatus:@"请至少输入10个字"];
        return;
    }
    [self.view endEditing:YES];

    [self.sviewModel answerQuestion:_answerTextView.text completionHandle:^(BOOL success, NSError *error, id result) {
        if (success) {
            _answerTextView.text = @"";
            [SVProgressHUD showSuccessWithStatus:@"回复成功"];
            _hidBtn.hidden = YES;
            _answerView.hidden = YES;
            [self.table.mj_header beginRefreshing];
        }else{
            [SVProgressHUD showSuccessWithStatus:result];
        }
        
    }];

}
- (void)keyboardDidShow
{
    _keyboardIsVisible = YES;
}

- (void)keyboardDidHide
{
    _keyboardIsVisible = NO;
}

- (BOOL)keyboardIsVisible
{
    return _keyboardIsVisible;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //[text isEqualToString:@""] 表示输入的是退格键
    if (![text isEqualToString:@""])
    {
        _pLabel.hidden = YES;
    }
    
    //range.location == 0 && range.length == 1 表示输入的是第一个字符
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
        
    {
        _pLabel.hidden = NO;
    }
    return YES;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
