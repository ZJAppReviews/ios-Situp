//
//  ViewController.m
//  Situp
//
//  Created by lepdou on 15/9/17.
//  Copyright (c) 2015年 lepdou. All rights reserved.
//

#import "ViewController.h"
#import "STCommon.h"
#import "STLevelSelectorController.h"
#import "STLevelSelector.h"
#import "STTrainPlanController.h"
#import "STTrainHistoryController.h"

@interface ViewController ()

@property(nonatomic, strong) UIButton *go;
@property(nonatomic, strong) UIButton *selectLevel;
@property(nonatomic, strong) UIButton *help;
@property(nonatomic, strong) UIButton *history;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化rootView
    UIView *rootView = self.view;
    rootView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_background"]];
    self.title = @"仰卧起坐教练";
    #pragma clang diagnostic ignored"-Wdeprecated-declarations"
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];

    //开始锻炼按钮
    self.go = [self navBtnWithText:@"开始锻炼"
                         withFrame:CGRectMake([self marginLeft], ([UIScreen height] - [self btnGroupHeight])/2, [self btnWidth], [self btnHeight])
               withSelector:@selector(trainBtnClick)];
    [self.view addSubview:self.go];
    
    //选择级别按钮
    self.selectLevel = [self navBtnWithText:@"选择级别"
                         withFrame:CGRectMake([self marginLeft], _go.frame.origin.y + [self btnHeight] + [self spaceBetweenBtn], [self btnWidth], [self btnHeight])
                        withSelector:@selector(levelBtnClick)];
    [self.view addSubview:self.selectLevel];
    
    //历史按钮
    self.history = [self navBtnWithText:@"历史记录"
                              withFrame:CGRectMake([self marginLeft], _go.frame.origin.y + ([self btnHeight] + [self spaceBetweenBtn]) * 2, [self btnWidth], [self btnHeight])
                           withSelector:@selector(historyBtnClick)];
    [self.view addSubview:self.history];
    
//    //帮助按钮
//    self.help = [self navBtnWithText:@"查看帮助"
//                         withFrame:CGRectMake([self marginLeft], _history.frame.origin.y + [self btnHeight] + [self spaceBetweenBtn], [self btnWidth], [self btnHeight])
//                 withSelector:@selector(levelBtnClick)];
//    [self.view addSubview:self.help];

}

-(void)levelBtnClick{
    STLevelSelectorController *selectPage = [[STLevelSelectorController alloc] init];
    [self.navigationController pushViewController:selectPage animated:YES];
}

-(void)trainBtnClick{
    STTrainPlanController *trainPlanController = [[STTrainPlanController alloc]init];
    [self.navigationController pushViewController:trainPlanController animated:YES];
}

-(void)historyBtnClick{
    STTrainHistoryController *vc = [[STTrainHistoryController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UIButton *)navBtnWithText:(NSString *)text withFrame:(CGRect)frame withSelector:(SEL) sel{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = frame;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:[self cornerRadius]];
    btn.titleLabel.font = [self textSize];
    [btn setTitleColor:[self textColor] forState:UIControlStateNormal];
    btn.backgroundColor = [self btnBgColor];
    [btn setBackgroundImage:[UIImage imageWithColor:[self btnBgColor]] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:[self btnHeightlightBgColor]] forState:UIControlStateHighlighted];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

-(CGFloat)btnGroupHeight{
    return [self btnHeight]*3 + [self spaceBetweenBtn]*2;
}

-(CGFloat)spaceBetweenBtn{
    return 20;
}

-(CGFloat)btnWidth{
    return 150;
}

-(CGFloat)btnHeight{
    return 50;
}

-(CGFloat)marginLeft{
    return ([UIScreen width] - [self btnWidth])/2;
}

-(UIColor *)textColor{
    return [UIColor whiteColor];
}

-(UIFont *)textSize{
    return [UIFont systemFontOfSize:20];
}

-(CGFloat)cornerRadius{
    return 10.0;
}

-(UIColor *)btnBgColor{
    return [UIColor colorWithHexString:@"2a5caa"];
}

-(UIColor *)btnHeightlightBgColor{
    return [UIColor colorWithHexString:@"181d4b"];
}

@end
