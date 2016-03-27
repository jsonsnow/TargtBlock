//
//  UIButton+CLBlock.h
//  YYBlueTool
//
//  Created by MYO on 16/3/24.
//  Copyright © 2016年 MYO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CLBlock)

/**
 *  返回一个带block属性的button
 *
 *  @param title      button的标题
 *  @param type       button的类型
 *  @param image      button的图片
 *  @param clickBlock 点击时候通过这个block回传
 *
 *  @return 返回一个Button实例
 */
+(instancetype)buttonWithTile:(NSString *)title
                      andType:(UIControlState)type andImage:(UIImage *)image
             andTheClickBlock:(void(^)(UIButton *button))clickBlock andTheEvent:(UIControlEvents)event;

@end
