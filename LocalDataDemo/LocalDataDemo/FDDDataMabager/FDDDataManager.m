//
//  FDDDataManager.m
//  LocalDataDemo
//
//  Created by 方冬冬 on 2017/11/29.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "FDDDataManager.h"
#import "FMDB.h"
#define BUYCARLABEL  @"BuyCar" // 购物车数据表

@interface FDDDataManager()
@property (nonatomic, strong)FMDatabase *db;
@property (nonatomic, strong)NSString *dbPath;
@property(nonatomic,readwrite,copy)NSString *idStr;

@end

@implementation FDDDataManager
static FDDDataManager *dbManager = nil;

+ (instancetype)shareDatabase{
    
    return [FDDDataManager shareDatabase:nil];
}
+ (instancetype)shareDatabase:(NSString *)dbName{
    
    return [FDDDataManager shareDatabase:dbName path:nil];
}
+ (instancetype)shareDatabase:(NSString *)dbName path:(NSString *)dbPath{
    if (!dbManager) {
        
        NSString *path;
        if (!dbName) {
            dbName = @"JQFMDB.sqlite";
        }
        if (!dbPath) {
            path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:dbName];
        } else {
            path = [dbPath stringByAppendingPathComponent:dbName];
        }
        NSLog(@"dbpath == %@",path);
        FMDatabase *fmdb = [FMDatabase databaseWithPath:path];
        if ([fmdb open]) {
            dbManager = FDDDataManager.new;
            dbManager.db = fmdb;
            dbManager.dbPath = path;
        }
    }
    if (![dbManager.db open]) {
        NSLog(@"database can not open !");
        return nil;
    };
    [dbManager createDataTable];
    return dbManager;
}
//  创建数据表
- (void)createDataTable {
    // 查询数据表中元素个数  判断数据表是存在
    FMResultSet *set = [self.db executeQuery:[NSString stringWithFormat:@"select count(*) from sqlite_master where type ='table' and name = '%@'", BUYCARLABEL]];
    while ([set next]) {
        NSInteger count = [set intForColumnIndex:0];
        if (count) {
            NSLog(@"数据表已经存在");
        } else {
            // 创建新的数据表
            NSString *sql = [NSString stringWithFormat:@"CREATE TABLE %@ (orderNum INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL, ID text,p_name text, p_source text, p_describe text, p_type text, p_name_other text, p_other_score text, p_loca_place text, p_other_place text, p_other_place_score text, p_visitors text,p_other_visitors text,p_other_visitors_score text,sixteen_percentage text,food_machine text,drinks_machine text,convenience_store text,indoor text,indoor_remarks text,power_supply text,power_supply_describe text,network_situation text,logistics_limit text,total_score text,comprehensive_assessment text,point_assessment text,distant_view_photograph text,close_view_photograph text,power_photograph text,other_photograph text)", BUYCARLABEL];
            BOOL res = [self.db executeUpdate:sql];
            if (!res) {
                NSLog(@"数据表创建失败");
            } else {
                NSLog(@"数据表创建成功");
            }
        }
    }
}
//  插入一条数据
- (void)saveUserInfoModel:(UserInfo *)userInfoModel{
    if ([self.db open]) {//先判断数据库是否打开
//    //先根据ID查询对应的model是否纯正。如果存在 不在进行插入
        UserInfo *newModel = [self findUserInfoWithUserID:userInfoModel.ID];
        if (![self isBlankString:newModel.ID]) {
            NSLog(@"数据已经存在");
            return;
        }
    // 创建插入语句
    NSMutableString *query = [NSMutableString stringWithFormat:@"INSERT INTO %@ (ID,p_name,p_source,p_describe, p_type, p_name_other, p_other_score, p_loca_place, p_other_place, p_other_place_score,p_visitors,p_other_visitors,p_other_visitors_score,sixteen_percentage,food_machine,drinks_machine,convenience_store,indoor,indoor_remarks,power_supply,power_supply_describe,network_situation,logistics_limit,total_score,comprehensive_assessment,point_assessment,distant_view_photograph,close_view_photograph,power_photograph,other_photograph) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", BUYCARLABEL];
    // 创建插入内容
    NSMutableArray *arguments = [NSMutableArray array];
    if (userInfoModel.ID == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.ID];
    }

    if (userInfoModel.p_name == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_name];
    }
    if (userInfoModel.p_source == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_source];
    }
    if (userInfoModel.p_describe == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_describe];
    }
    
    if (userInfoModel.p_type == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_type];
    }
    if (userInfoModel.p_name_other == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_name_other];
    }
    if (userInfoModel.p_other_score == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_other_score];
    }
    if (userInfoModel.p_loca_place == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_loca_place];
    }
    if (userInfoModel.p_other_place == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_other_place];
    }
    if (userInfoModel.p_other_place_score == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_other_place_score];
    }
    
    if (userInfoModel.p_visitors == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_visitors];
    }
    
    if (userInfoModel.p_other_visitors == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.p_other_visitors];
    }
    
    if (userInfoModel.sixteen_percentage == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.sixteen_percentage];
    }
    
    if (userInfoModel.food_machine == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.food_machine];
    }
    
    if (userInfoModel.drinks_machine == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.drinks_machine];
    }
    
    if (userInfoModel.convenience_store == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.convenience_store];
    }
    
    if (userInfoModel.indoor == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.indoor];
    }
    if (userInfoModel.indoor_remarks == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.indoor_remarks];
    }
    if (userInfoModel.power_supply == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.power_supply];
    }
    
    if (userInfoModel.power_supply_describe == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.power_supply_describe];
    }
    if (userInfoModel.network_situation == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.network_situation];
    }
    if (userInfoModel.logistics_limit == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.logistics_limit];
    }
    
    if (userInfoModel.total_score == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.total_score];
    }

    if (userInfoModel.comprehensive_assessment == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.comprehensive_assessment];
    }
    
    if (userInfoModel.comprehensive_assessment == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.comprehensive_assessment];
    }
    if (userInfoModel.point_assessment == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.point_assessment];
    }
    
    if (userInfoModel.distant_view_photograph == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.distant_view_photograph];
    }
    
    if (userInfoModel.close_view_photograph == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.close_view_photograph];
    }
        
    if (userInfoModel.power_photograph == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.power_photograph];
    }
    if (userInfoModel.other_photograph == NULL) {
        [arguments addObject:@" "];
    }else {
        [arguments addObject:userInfoModel.other_photograph];
    }
        
    NSLog(@"%@",query);
    NSLog(@"插入一条数据");
    // 执行语句
    BOOL res =  [self.db executeUpdate:query withArgumentsInArray:arguments];
    if (res) {
        NSLog(@"插入数据成功");
    } else {
        NSLog(@"插入数据失败");
    }
        [self.db close];
      }
}

//  通过用户id删除一条数据
- (void)deleteUserInfoWithID:(NSString *)userInfoID {
    if ([self.db open]) {
        NSString *query = [NSString stringWithFormat:@"DELETE FROM %@ WHERE ID = '%@'", BUYCARLABEL, userInfoID];
        NSLog(@"删除成功");
        BOOL res = [self.db executeUpdate:query];
        if (res) {
            NSLog(@"删除数据成功");
        } else {
            NSLog(@"删除数据失败");
        }
        [self.db close];
    }
}

/**
 根据用户ID更新数据

 @param userId 用户ID
 @param updateSql 更新数据的sql
 */
- (void)updateUserInfoWithUserId:(NSString *)userId andUpdateSql:(NSString *)updateSql{
    if ([self.db open]) {
        NSMutableString *query = [NSMutableString stringWithFormat:@"update %@ set %@ where ID = '%@'", BUYCARLABEL, updateSql, userId];
        BOOL res = [self.db executeUpdate:query];
        if (res) {
            NSLog(@"修改数据成功");
        } else {
            NSLog(@"修改数据失败");
        }
        [self.db close];
    }
    
}



/**
 数据库表增加字段

 @param SqlString 更新表字段的语句
 */
- (void)addAcolumnWithSqlString:(NSString *)SqlString{
    if ([self.db open]) {
        
        NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ADD %@ text",BUYCARLABEL,@"age"];//这是给一张名为人的表增加一个age字段
        [self.db executeUpdate:sql];
        //设值
        BOOL res =   [self.db executeUpdate:[NSString stringWithFormat:@"UPDATE %@ set age = %@",BUYCARLABEL,@"18"]];
        if (res) {
            NSLog(@"插入新字段成功");
        } else {
            NSLog(@"插入新字段失败");
        }
        [self.db close];
    }
}

/**
 用来查询表中是否含有某个字段
 @param columsName 字段名 对应表中的列名
 @return 返回Yes 则代表含有这个字段
 */
- (BOOL)selectHardTableColums:(NSString *)columsName{
    [_db open];
    NSString * sqlstr = [NSString stringWithFormat:@"select * from %@",BUYCARLABEL];
    FMResultSet * result = [_db executeQuery:sqlstr];
    [result columnIndexForName:columsName];
    
    NSLog(@"result = %@",result);
    NSDictionary * dict =   [result columnNameToIndexMap];
    if (dict) {
        for (NSString * keystr in [dict allKeys]) {
            if ([keystr containsString:columsName]) {
                NSLog(@"表中查询到对应的字段，不可以添加这个字段");
                return YES;
            }
        }
    }
    NSLog(@"表中没有查询到对应的字段，可以添加这个字段");
    return NO;
}

/**
 根据用户查询用户所有的信息

 @param userID 用户ID
 @return 返回一个装有所有用户信息的模型
 */
- (UserInfo *)findUserInfoWithUserID:(NSString *)userID{
    UserInfo *user = [[UserInfo alloc] init];
    if ([self.db open]) {
        NSMutableString *query = [NSMutableString stringWithFormat:@"SELECT * FROM %@ WHERE  ID = %@", BUYCARLABEL, userID];
        FMResultSet * rs = [self.db executeQuery:query];
        while ([rs next]) {
            user.ID = [rs stringForColumn:@"ID"];
            user.p_name = [rs stringForColumn:@"p_name"];
            user.p_source = [rs stringForColumn:@"p_source"];
            user.p_describe = [rs stringForColumn:@"p_describe"];
            user.p_type = [rs stringForColumn:@"p_type"];
            user.p_name_other = [rs stringForColumn:@"p_name_other"];
            user.p_other_score = [rs stringForColumn:@"p_other_score"];
            user.p_loca_place = [rs stringForColumn:@"p_loca_place"];
            user.p_other_place = [rs stringForColumn:@"p_other_place"];
            user.p_other_place_score = [rs stringForColumn:@"p_other_place_score"];
            user.p_visitors = [rs stringForColumn:@"p_visitors"];
            user.p_other_visitors = [rs stringForColumn:@"p_other_visitors"];
            user.p_other_visitors_score = [rs stringForColumn:@"p_other_visitors_score"];
            user.sixteen_percentage = [rs stringForColumn:@"sixteen_percentage"];
            user.food_machine = [rs stringForColumn:@"food_machine"];
            user.drinks_machine = [rs stringForColumn:@"drinks_machine"];
            user.convenience_store = [rs stringForColumn:@"convenience_store"];
            user.indoor = [rs stringForColumn:@"indoor"];
            user.indoor_remarks = [rs stringForColumn:@"indoor_remarks"];
            user.power_supply = [rs stringForColumn:@"power_supply"];
            user.power_supply_describe = [rs stringForColumn:@"power_supply_describe"];
            user.network_situation = [rs stringForColumn:@"network_situation"];
            user.logistics_limit = [rs stringForColumn:@"logistics_limit"];
            user.total_score = [rs stringForColumn:@"total_score"];
            user.comprehensive_assessment = [rs stringForColumn:@"comprehensive_assessment"];
            user.point_assessment = [rs stringForColumn:@"point_assessment"];
            user.distant_view_photograph = [rs stringForColumn:@"distant_view_photograph"];
            user.close_view_photograph = [rs stringForColumn:@"close_view_photograph"];
            user.power_photograph = [rs stringForColumn:@"power_photograph"];
            user.other_photograph = [rs stringForColumn:@"other_photograph"];

        }
        [rs close];
    }
    
    return user;
}

/**
 删除表。不删除sqlite
 @return  是否删除表成功
 */
- (BOOL)deleteTable{
    NSString *sqlstr = [NSString stringWithFormat:@"DROP TABLE %@", BUYCARLABEL];
    if (![_db executeUpdate:sqlstr])
    {
        return NO;
    }
    return YES;
}

/**
 删除sqlite文件

 @return 是否删除成功
 */
- (BOOL)fdd_dropDB{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *sqlFilePath = [path stringByAppendingPathComponent:@"JQFMDB.sqlite"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager removeItemAtPath:sqlFilePath error:NULL];
}

/**
判断是否是空字符串
 @param string string
 @return 是否是空字符串
 */
- (BOOL)isBlankString:(id)string {
    if (!string)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@"(null)"])
    {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@"<null>"])
    {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [string length]==0)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
    {
        return YES;
    }
    return NO;
}

@end
