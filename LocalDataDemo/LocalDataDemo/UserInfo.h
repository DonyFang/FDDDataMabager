//
//  UserInfo.h
//  LocalDataDemo
//
//  Created by 方冬冬 on 2017/11/29.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

/**
 用户ID。唯一标识
 */
@property(nonatomic,readwrite,copy)NSString *ID;
/**点位名称*/
@property (nonatomic,copy)NSString *p_name;
/**点位来源*/
@property(nonatomic,readwrite,copy)NSString *p_source;
/**
 省市区街道
 */
@property(nonatomic,readwrite,copy)NSString *p_describe;
/**
 点位类型
 */
@property(nonatomic,readwrite,copy)NSString *p_type;
/**
 其他点位名称
 */
@property(nonatomic,readwrite,copy)NSString *p_name_other;

/**
 其他点位得分
 */
@property(nonatomic,readwrite,copy)NSString  *p_other_score;

/**
 摆放位置
 */
@property(nonatomic,readwrite,copy)NSString *p_loca_place;


/**
 其他摆放位置
 */
@property(nonatomic,readwrite,copy)NSString *p_other_place;
/**
 其他摆放位置得分
 */
@property(nonatomic,readwrite,copy)NSString *p_other_place_score;


/**
 点位人流量统计
 */
@property(nonatomic,readwrite,copy)NSString *p_visitors;

/**
 其他点位人流量统计
 */
@property(nonatomic,readwrite,copy)NSString *p_other_visitors;
/**
 其他点位人流量得分
 */
@property(nonatomic,readwrite,copy)NSString *p_other_visitors_score;


/**
 16-40 岁人占比例
 */
@property(nonatomic,readwrite,copy)NSString *sixteen_percentage;


/**
 300米内食品综合机数量
 */
@property(nonatomic,readwrite,copy)NSString *food_machine;

/**
 300米内饮料综合机数量
 */
@property(nonatomic,readwrite,copy)NSString *drinks_machine;


/**
 300米内便利店以及小超市数量
 */
@property(nonatomic,readwrite,copy)NSString *convenience_store;

/**
 室内室外
 */
@property(nonatomic,readwrite,copy)NSString *indoor;


/**
 室内室外备注
 */
@property(nonatomic,readwrite,copy)NSString *indoor_remarks;

/**
 电源
 */
@property(nonatomic,readwrite,copy)NSString *power_supply;
/**
 电源备注
 */
@property(nonatomic,readwrite,copy)NSString *power_supply_describe;

/**
 4G网络情况
 */
@property(nonatomic,readwrite,copy)NSString *network_situation;

/**
 布机和商品配送的物流限制
 */
@property(nonatomic,readwrite,copy)NSString *logistics_limit;

/**
 合计分数
 */
@property(nonatomic,readwrite,copy)NSString *total_score;

/**
 综合评价
 */
@property(nonatomic,readwrite,copy)NSString *comprehensive_assessment;


/**
 点位评估
 */
@property(nonatomic,readwrite,copy)NSString *point_assessment;

/**
 远景照片
 */
@property(nonatomic,strong)NSString *distant_view_photograph;
/**
 近景照片
 */
@property(nonatomic,strong)NSString *close_view_photograph;

/**
 电源照片
 */
@property(nonatomic,strong)NSString *power_photograph;


/**
 其他照片
 */
@property(nonatomic,strong)NSString *other_photograph;


@end
