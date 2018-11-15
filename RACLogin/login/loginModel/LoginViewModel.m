//
//  LoginViewModel.m
//  RACLogin
//
//  Created by 王得胜 on 2018/11/16.
//  Copyright © 2018 com.youqii.com. All rights reserved.
//

#import "LoginViewModel.h"
#import "FirstViewController.h"

@implementation LoginViewModel
-(instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    self.loginButtonEnableSignal = [RACSignal combineLatest:@[RACObserve(self, username),RACObserve(self, password)] reduce:^id(NSString *username,NSString *password){
        return @(username.length && password.length);
    }];
    
    self.loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
            [subscriber sendNext:@"success"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                /**-----发送完成这一步很重要,不然后面的信号无法执行----**/
                [subscriber sendCompleted];//表明数据传递完成,如果不执行此行代码,则永远处于执行中
            });
            return nil;
        }];
    }];
    
    [self.loginCommand.executionSignals.switchToLatest subscribeNext:^(NSString *x) {
        if ([x isEqualToString:@"success"]) {
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            [SVProgressHUD dismissWithDelay:1 completion:^{
                FirstViewController *first = [[FirstViewController alloc]init];
                [UIView animateWithDuration:1.0 animations:^{
                    [UIApplication sharedApplication].keyWindow.rootViewController = first;
                }];
            }];
        }else{
            [SVProgressHUD showErrorWithStatus:@"登录失败"];
            [SVProgressHUD dismissWithDelay:1.0];
        }
    }];
    
    [[self.loginCommand.executing skip:1] subscribeNext:^(NSNumber *x) {
        if ([x boolValue]) {
            [SVProgressHUD showWithStatus:@"正在登录中"];
        }else{
            [SVProgressHUD showWithStatus:@"登录完成"];
        }
    }];
    
}

@end
