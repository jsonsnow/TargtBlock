//
//  CLWelcomeFunction.h
//  YYBlueTool
//
//  Created by MYO on 16/3/24.
//  Copyright © 2016年 MYO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeclomeFormat : NSObject
/**
 *  设置选中圆点的颜色 为空默认为黄色
 */
@property (nonatomic, strong) UIColor  *pageIndexColor;
/**
 *  设置最后一页button文字的颜色 为空则默认为黄色
 */
@property (nonatomic, strong) UIColor  *buttonColor;
/**
 *  设置最后一页button的frame 不传则给的默认
 */
@property (nonatomic, assign) CGRect   buttonFrame;
/**
 *  设置pageController的frame 不传则给定默认
 */
@property (nonatomic, assign) CGRect   pageControllerFrame;
/**
 *  设置button的frame 为空则默认为点击进入
 */
@property (nonatomic, strong) NSString *buttonTitle;
/**
 *  设置button的背景图片 为空则不设置图片
 */
@property (nonatomic, strong) UIImage  *buttonImage;
/**
 *  最后一页是否隐藏pageController 不设置则默认不隐藏
 */
@property (nonatomic, assign) BOOL hideThePage;


@end
@interface CLWelcomeFunction : UIView
/**
 *  根据传入的图片名字数组初始化，欢迎界面
 *
 *  @param imageArray 图片数据名
 *  @param clickBlock 点击按钮时候的相应
 *
 *  @return 返回该试图
 */
//+(instancetype)configTheWeclomeMessage:(NSArray *)imageArray
//                     andTheClickAction:(void(^)(UIButton *button))clickBlock;
/**
 *  配置欢迎界面信息
 *
 *  @param imageArray 每个界面对应的图片名
 *  @param format     返回一个weclomeFormat类型的实例，根据这个对象设置相应信息
 *  @param clickBlock 点击按钮时候的相应
 *
 *  @return 返回创建好的欢迎界面视图
 */
+(instancetype)configTheWeclomeMessage:(NSArray *)imageArray
                          andTheFormat:(WeclomeFormat *(^)())format
                     andTheClickAction:(void(^)(UIButton *button))clickBlock;

@end
