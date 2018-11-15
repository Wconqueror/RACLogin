//
//  LoginView.m
//  RACLogin
//
//  Created by 王得胜 on 2018/11/16.
//  Copyright © 2018 com.youqii.com. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()
@property(nonatomic,strong) UILabel *accountLabel;
@property(nonatomic,strong) UILabel *pwdLabel;
@end

@implementation LoginView
-(instancetype)init{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    [self addSubview:self.accountLabel];
    [self addSubview:self.accountText];
    [self addSubview:self.pwdLabel];
    [self addSubview:self.pwdText];
    [self addSubview:self.loginBtn];
}

-(UILabel *)accountLabel{
    if (!_accountLabel) {
        _accountLabel = [[UILabel alloc]init];
        _accountLabel.text = @"用户名";
        _accountLabel.textColor = [UIColor blackColor];
    }
    return _accountLabel;
}

-(UILabel *)pwdLabel{
    if (!_pwdLabel) {
        _pwdLabel = [[UILabel alloc]init];
        _pwdLabel.text = @"密 码";
        _pwdLabel.textColor = [UIColor blackColor];
    }
    return _pwdLabel;
}

-(UITextField *)accountText{
    if (!_accountText) {
        _accountText = [[UITextField alloc]init];
        _accountText.placeholder = @"请输入用户名";
        _accountText.borderStyle = UITextBorderStyleRoundedRect;
        _accountText.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _accountText;
}

-(UITextField *)pwdText{
    if (!_pwdText) {
        _pwdText = [[UITextField alloc]init];
        _pwdText.placeholder = @"请输入密码";
        _pwdText.borderStyle = UITextBorderStyleRoundedRect;
        _pwdText.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _pwdText;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        _loginBtn.backgroundColor = [UIColor blueColor];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_loginBtn setTitleColor:[UIColor redColor] forState:(UIControlStateHighlighted)];
        [_loginBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateDisabled)];
        _loginBtn.enabled = NO;
        _loginBtn.layer.cornerRadius = 5;
    }
    return _loginBtn;
}

-(void)layoutSubviews{
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.top.equalTo(self.mas_top).offset(150);
        make.width.equalTo(@60);
        make.height.equalTo(@40);
    }];
    
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountLabel.mas_right).offset(20);
        make.right.equalTo(self.mas_right).offset(-30);
        make.top.equalTo(self.accountLabel.mas_top);
        make.height.equalTo(self.accountLabel.mas_height);
    }];
    
    [self.pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountLabel.mas_left);
        make.top.equalTo(self.accountLabel.mas_bottom).offset(50);
        make.width.equalTo(self.accountLabel.mas_width);
        make.height.equalTo(self.accountLabel.mas_height);
    }];
    
    [self.pwdText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountText.mas_left);
        make.right.equalTo(self.accountText.mas_right);
        make.top.equalTo(self.pwdLabel.mas_top);
        make.height.equalTo(self.accountText.mas_height);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(50);
        make.right.equalTo(self.mas_right).offset(-50);
        make.top.equalTo(self.pwdLabel.mas_bottom).offset(100);
        make.height.equalTo(@50);
    }];
}

@end
