//
//  ViewController.m
//  dynamicChat
//
//  Created by lanou on 16/8/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "DXText.h"

@interface ViewController ()<UITextFieldDelegate>{
    UITextField *userText;
    UILabel *userTextName;
    
    UITextField *eamilText;
    UILabel *emailLabel;
    
    UITextField *passWordText;
    UILabel *passwordLabel;
    
    UIButton *loginBtn;
    
    BOOL chang;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup_CLRectangle];
}

-(UILabel *)setupTextName:(NSString *)textName frame:(CGRect)frame{
    UILabel *textNameLabel = [[UILabel alloc] init];
    textNameLabel.text = textName;
    textNameLabel.font = [UIFont systemFontOfSize:16];
    textNameLabel.textColor = [UIColor grayColor];
    textNameLabel.frame = frame;
    return textNameLabel;
}

#pragma mark-- 私有方法布局 ---
-(void)setup_CLRectangle{
    CGFloat centerX = self.view.width * 0.5;
    // 创建调用方法的对象
    DXText *cltext = [[DXText alloc] init];
    CGFloat userY = 100;
    UITextField *userText1 = [cltext setupWithIcon:nil textY:userY centerX:centerX point:nil];
    userText1.delegate = self;
    userText = userText1;
    
    // 键盘回收
    [userText1 setReturnKeyType:UIReturnKeyNext];
    
    [userText1 addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:userText1];
    
    UILabel *userTextName1 = [self setupTextName:@"昵称" frame:userText1.frame];
    userTextName = userTextName1;
    [self.view addSubview:userTextName1];
    
    
    CGFloat emailY = CGRectGetMaxY(userText1.frame) + 30;
    UITextField *emailText1 = [cltext setupWithIcon:nil textY:emailY centerX:centerX point:nil];
    // 制定键盘类型，进行email地址优化
    [emailText1 setKeyboardType:UIKeyboardTypeEmailAddress];
    [emailText1 setReturnKeyType:UIReturnKeyNext];
    emailText1.delegate = self;
    eamilText = emailText1;
    [self.view addSubview:emailText1];
    
    UILabel *emailTextName1 = [self setupTextName:@"邮箱" frame:emailText1.frame];
    emailLabel = emailTextName1;
    [self.view addSubview:emailTextName1];
    
    CGFloat passwordY = CGRectGetMaxY(emailText1.frame) + 30;
    UITextField *passwordText1 = [cltext setupWithIcon:nil textY:passwordY centerX:centerX point:nil];
    [passwordText1 setKeyboardType:UIKeyboardTypeEmailAddress];
    [passwordText1 setReturnKeyType:UIReturnKeyNext];
    passwordText1.delegate = self;
    passwordText1.secureTextEntry = YES;
    passWordText = passwordText1;
    [passwordText1 addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:passwordText1];
    
    UILabel *passwordTextLabel = [self setupTextName:@"密码" frame:passwordText1.frame];
    passwordLabel = passwordTextLabel;
    [self.view addSubview:passwordTextLabel];
    
    UIButton *loginBtn1 = [[UIButton alloc] init];
    loginBtn1.width = 200;
    loginBtn1.height = 30;
    loginBtn1.centerX = self.view.width * 0.5;
    loginBtn1.y = CGRectGetMaxY(passwordText1.frame) + 30;
    [loginBtn1 setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn1 setBackgroundColor:[UIColor orangeColor]];
    loginBtn1.enabled = NO;
    loginBtn = loginBtn1;
    [loginBtn addTarget:self action:@selector(logibBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn1];

}


- (void)textFieldDidChange {
    
}

#pragma mark --- 执行偏移动画，并修改字体

-(void)diminishTextName:(UILabel *)label{
    [UIView animateWithDuration:0.5 animations:^{
       
        label.transform = CGAffineTransformMakeTranslation(0, -16);
        label.font = [UIFont systemFontOfSize:9];
    }];
}

#pragma mark --- 根据输入框的数据，赋值bool
-(void)textFieldTextChange:(UITextField *)textField{
    // 如果有数据，bool 置为no
    if (textField.text.length != 0) {
        chang = NO;
    }else{
        chang = YES;
    }
}

-(void)restoreTextName:(UILabel *)label textField:(UITextField *)textField{
    // 调用赋值BOOL
    [self textFieldTextChange:textField];
    
    // 根据bool 值来判断是否执行动画
    if (chang) {
        [UIView animateWithDuration:0.5 animations:^{
            //  CGAffineTransformIdentity：Transform发生的改变都会被还原。
            label.transform = CGAffineTransformIdentity;
            label.font = [UIFont systemFontOfSize:16];
            
        }];
    }
}


#pragma mark --- UITextFieldDelegate --
// textField.text是判断是否执行动画
// label是执行动画者

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    // 如果点击第一个输入框
    if (textField == userText) {
        // 开启动画效果
        [self diminishTextName:userTextName];
        // 判断其他两个输入框是否执行了动画
        [self restoreTextName:emailLabel textField:eamilText];
        
        [self restoreTextName:passwordLabel textField:passWordText];
    }else if (textField == eamilText){
        // 开启动画效果
        [self diminishTextName:emailLabel];
        // 判断其他两个输入框是否执行了动画
        [self restoreTextName:userTextName textField:userText];
        [self restoreTextName:passwordLabel textField:passWordText];
    }else if (textField == passWordText){
        // 开启动画效果
        [self diminishTextName:passwordLabel];
        // 判断其他两个输入框是否执行了动画
        [self restoreTextName:emailLabel textField:eamilText];
        [self restoreTextName:userTextName textField:userText];
    }
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
