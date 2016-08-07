//
//  DXText.h
//  dynamicChat
//
//  Created by lanou on 16/8/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface DXText : NSObject


/**
 *  下列方法参数
 *
 *  @param icon    输入框图标
 *  @param textY   Y点坐标
 *  @param centerX 中心点X值
 *  @param point   输入框提示字符
 */
-(UITextField *)setupWithIcon:(NSString *)icon textY:(CGFloat)textY centerX:(CGFloat)centerX point:(NSString *)point;

@end
