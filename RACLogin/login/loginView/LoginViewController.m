//
//  LoginViewController.m
//  RACLogin
//
//  Created by 王得胜 on 2018/11/16.
//  Copyright © 2018 com.youqii.com. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"

@interface LoginViewController ()
@property (nonatomic,strong) LoginView *loginView;
@property (nonatomic,strong) LoginViewModel *loginViewModel;
@end

@implementation LoginViewController

-(LoginViewModel *)loginViewModel{
    if (!_loginViewModel) {
        _loginViewModel = [[LoginViewModel alloc]init];
    }
    return _loginViewModel;
}


-(LoginView *)loginView{
    if (!_loginView) {
        _loginView = [[LoginView alloc]init];
        _loginView.backgroundColor = [UIColor whiteColor];
    }
    return _loginView;
}

-(void)loadView{
    self.view = self.loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self loginButtonEnable];
    [self loginButtonAction];
}

-(void)loginButtonEnable{
    RAC(self.loginViewModel,username) = _loginView.accountText.rac_textSignal;
    RAC(self.loginViewModel,password) = _loginView.pwdText.rac_textSignal;
    RAC(self.loginView.loginBtn,enabled) = _loginViewModel.loginButtonEnableSignal;
}

-(void)loginButtonAction{
    [[self.loginView.loginBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(UIControl *x) {
        [self.loginViewModel.loginCommand execute:nil];
    }];
}

@end
