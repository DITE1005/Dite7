//
//  DXText.m
//  dynamicChat
//
//  Created by lanou on 16/8/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "DXText.h"
#import "UIView+Extension.h"

@implementation DXText

/**
 *  下列方法参数
 *
 *  @param icon    输入框图标
 *  @param textY   Y点坐标
 *  @param centerX 中心点X值
 *  @param point   输入框提示字符
 */
-(UITextField *)setupWithIcon:(NSString *)icon textY:(CGFloat)textY centerX:(CGFloat)centerX point:(NSString *)point{
    UITextField *textField = [[UITextField alloc] init];
    textField.width = 232;
    textField.height = 23;
    textField.centerX = centerX;
    textField.y = textY;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 23, 232, 0)];
    // 透明度
    view.alpha = 0.5;
    view.backgroundColor = [UIColor grayColor];
    [textField addSubview:view];
    
    textField.placeholder = point;
    textField.font = [UIFont systemFontOfSize:16];
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    
    UIImage *bigIcon = [UIImage imageNamed:icon];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:bigIcon];
    if (icon) {
        imgView.width = 34;
    }
    imgView.contentMode = UIViewContentModeLeft;
    textField.leftView = imgView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    return textField;
}
@end
