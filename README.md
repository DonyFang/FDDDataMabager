# FDDDataMabager
FDDDataMabager

主要API介绍
+ (instancetype)shareDatabase;
+ (instancetype)shareDatabase:(NSString *)dbName;
+ (instancetype)shareDatabase:(NSString *)dbName path:(NSString *)dbPath;
//保存用户信息
- (void)saveUserInfoModel:(UserInfo *)userInfoModel;
//根据用户id查询用户信息
- (UserInfo *)findUserInfoWithUserID:(NSString *)userID;
//根据用户id删除用户信息
- (void)deleteUserInfoWithID:(NSString *)userInfoID;
//更新用户信息
- (void)updateUserInfoWithUserId:(NSString *)userId andUpdateSql:(NSString *)updateSql;
/**
 删除数据表
 */
- (BOOL)deleteTable;
/**
 删除sqlite文件
 */
- (BOOL)fdd_dropDB;
/**
 更新表结构插入新的字段
 @param SqlString 新的字段名
 */
- (void)addAcolumnWithSqlString:(NSString *)SqlString;

/**
 用来查询表中是否含有某个字段
 @param columsName 字段名 对应表中的列名
 @return 返回Yes 则代表含有这个字段
 */
- (BOOL)selectHardTableColums:(NSString *)columsName;
