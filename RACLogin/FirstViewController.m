//
//  FirstViewController.m
//  RACLogin
//
//  Created by 王得胜 on 2018/11/16.
//  Copyright © 2018 com.youqii.com. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic,strong) UILabel *label;
@end

@implementation FirstViewController

-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"欢迎来到首页";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor blueColor];
    }
    return _label;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.label];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(@150);
        make.height.equalTo(@50);
    }];
}

@end
