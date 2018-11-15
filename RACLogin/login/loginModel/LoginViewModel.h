//
//  LoginViewModel.h
//  RACLogin
//
//  Created by 王得胜 on 2018/11/16.
//  Copyright © 2018 com.youqii.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject
@property (nonatomic,copy) NSString *username;

@property (nonatomic,copy) NSString *password;

@property (nonatomic,strong) RACSignal *loginButtonEnableSignal;

//RACCommand 必须使用强引用,否则接受不到RACCommand中的信号,RACCommand中的信号是延时发送的
@property (nonatomic,strong) RACCommand *loginCommand;

@end

NS_ASSUME_NONNULL_END
