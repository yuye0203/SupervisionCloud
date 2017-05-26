//
//  ScreenVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/9.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "ScreenVC.h"
#import "ScreenVM.h"
#import "LCActionAlertView.h"
#import "WSDatePickerView.h"
#import "QuestionType.h"
#import "FindResourVC.h"
#import "FindeQuestionVC.h"

static NSString *const DateCellIdentifier = @"SVCloudDateCell" ;
static NSString *const SelectorIdentifier = @"SVCloudSelectorCell" ;
static NSString *const TextIdentifier = @"SVCloudTextFieldCell" ;

@interface ScreenVC ()


@property(nonatomic,strong)NSArray  *typeArr;
@property(nonatomic,strong)NSMutableDictionary  *resultDic;

@property(nonatomic,weak)IBOutlet UITextField  *typeT;
@property(nonatomic,weak)IBOutlet UITextField  *timeStartT;
@property(nonatomic,weak)IBOutlet UITextField  *timeEndT;
@property(nonatomic,weak)IBOutlet UITextField  *keyWordT;

@property (nonatomic, strong) ScreenVM *sviewModel;

@end


@implementation ScreenVC

-(NSMutableDictionary *)resultDic{
    if (!_resultDic) {
        _resultDic = [[NSMutableDictionary alloc] initWithCapacity:4];
    }
    return _resultDic;
}

-(NSArray *)typeArr{
    if (!_typeArr) {
        _typeArr = [NSArray array];
    }
    return _typeArr;
}


- (ScreenVM *)sviewModel {
    if (_sviewModel == nil) {
        _sviewModel = [[ScreenVM alloc]init];
    }
    return _sviewModel;
}

-(void)viewDidLoad
{
   
    [super viewDidLoad];
    [self creatTable];
    
}
-(void)creatTable{
    
    [self.sviewModel loadQuestionTypeWithType:self.fromType                         CompletionHandle:^(BOOL success, NSError *error,id result){
        if (success) {
            self.typeArr = [NSArray arrayWithArray:(NSArray *)result];

        }
        
    }];
}
-(IBAction)showTypeView{
    NSMutableArray *nameArr =[NSMutableArray arrayWithCapacity:self.typeArr.count];
    for (QuestionType *item in self.typeArr) {
        [nameArr addObject:item.name];
    }
    
    [LCActionAlertView showActionViewNames:nameArr completed:^(NSInteger index,NSString * name) {
        self.typeT.text = name;
        QuestionType *type = self.typeArr[index];
        [self.resultDic addEntriesFromDictionary:@{@"type":[NSNumber numberWithInteger:type.idField]}];
//        type			int	类型id
//        start_time			date	开始时间
//        end_time			date	结束时间
//        keyword			string	关键词
        //        self.viewModel.type = index;
    } canceled:^{
        NSLog(@"canceled");
    }];
    
}
-(IBAction)showDataPick:(id)sender{
    
    UIButton *btn  = (UIButton *)sender;
    
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *startDate) {
        NSString *date = [startDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
        NSLog(@"时间： %@",date);
        if (btn.tag == 100) {
            self.timeStartT.text =date;
            [self.resultDic addEntriesFromDictionary:@{@"start_time":startDate}];

        }else{
            self.timeEndT.text = date;
            [self.resultDic addEntriesFromDictionary:@{@"end_time":startDate}];

        }
    }];
    datepicker.doneButtonColor = [UIColor blueColor];//确定按钮的颜色
    [datepicker show];

}
//-(IBAction)goToResults:(id)sender{
//    [self.view endEditing:YES];
//    if (self.keyWordT.text.length>0) {
//        [self.resultDic addEntriesFromDictionary:@{@"keyword":self.keyWordT.text}];
//        
//    }
//    [self ex]
//
// 
//}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    [self.view endEditing:YES];
    if (self.keyWordT.text.length>0) {
        [self.resultDic addEntriesFromDictionary:@{@"keyword":self.keyWordT.text}];
        
    }
    UIButton *btn = (UIButton *)sender;
    if (btn.tag==100) {
        NSLog(@"segue =%@",segue.identifier);
        
        UIViewController *vc = segue.destinationViewController;
        if ([vc isKindOfClass:[FindResourVC class]]) {
            FindResourVC *fVC = (FindResourVC *)vc;
//            fVC.NEE
        }else if ([vc isKindOfClass:[FindeQuestionVC class]]) {
            FindeQuestionVC *fVC = (FindeQuestionVC *)vc;
            fVC.needReset = YES;
            fVC.params = self.resultDic;
        }


    }
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
