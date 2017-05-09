//
//  BaseVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/3.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseVC.h"
#import "NSString+MD5HexDigest.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
-(NSDictionary *)parametersWithDic:(NSMutableDictionary *)mdic{

    NSDictionary *cmdDic = @{@"cmd":[mdic objectForKey:@"cmd"]};
    [mdic removeObjectForKey:@"cmd"];
    NSArray *keysArray = [mdic allKeys];
    
    NSArray *resultArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];  

    
    NSMutableString *vieryStr = [NSMutableString stringWithCapacity:20];
    
    for (NSString *key in resultArray){
        [vieryStr appendString:[NSString stringWithFormat:@"%@",mdic[key]]];
    }
    [vieryStr appendString:@"jianliyun"];
    
    [mdic addEntriesFromDictionary:@{@"verify":[vieryStr md5HexDigest]}];
    
    NSDictionary *temp = [NSDictionary dictionaryWithDictionary:mdic];
    [mdic removeAllObjects];
    
    [mdic addEntriesFromDictionary:cmdDic];
    [mdic addEntriesFromDictionary:@{@"params":temp}];
  
    return mdic;

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
