//
//  ViewController.m
//  LocalDataDemo
//
//  Created by 方冬冬 on 2017/11/29.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ViewController.h"
#import "FDDDataManager.h"
#import "UserInfo.h"
@interface ViewController ()
@property(nonatomic,strong)FDDDataManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.manager = [FDDDataManager shareDatabase];
    
    
    
}


- (IBAction)addData:(id)sender {
    UserInfo *user = [[UserInfo alloc] init];
    user.p_name = @"测试";
    user.ID = @"222";
    [self.manager saveUserInfoModel:user];
    
}


- (IBAction)clearData:(id)sender {

    UserInfo *str =   [self.manager findUserInfoWithUserID:@"222"];
    NSLog(@"%@ %@ %@",str.p_name,str.ID,str.distant_view_photograph);
    
}

- (IBAction)delete:(id)sender {
    [self.manager deleteTable];
    
}

- (IBAction)changeTable:(id)sender {
        
    [self.manager addAcolumnWithSqlString:nil];
}




- (IBAction)update:(id)sender {
    NSError *err = nil;
    NSArray *picArr = @[@"1.png",@"2.png",@"3.png"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:picArr options:NSJSONWritingPrettyPrinted error:&err];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *imageStr= [NSString stringWithFormat:@"distant_view_photograph ='%@'",jsonStr];
    [self.manager updateUserInfoWithUserId:@"111" andUpdateSql:imageStr];
    
}
@end
