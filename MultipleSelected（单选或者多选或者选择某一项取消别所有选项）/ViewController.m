//
//  ViewController.m
//  MultipleSelected（单选或者多选或者选择某一项取消别所有选项）
//
//  Created by hello on 2018/3/8.
//  Copyright © 2018年 Hello. All rights reserved.
//

#import "ViewController.h"
#import "MRResumeMoreView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //显示
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,20, self.view.frame.size.width,100)];
    label.textColor = [UIColor whiteColor];
    label.text = @"您还没有选择";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    
    NSArray *contentArray = @[@"不限",@"大专",@"本科",@"硕士",@"博士",@"研究生",@"MBA",@"EMBA",@"中专",@"高中",@"初中"];
   //单选
//    MRResumeMoreView *resumeMoreView = [[MRResumeMoreView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 200) andContentArray:contentArray];
//    resumeMoreView.selectType = OneSelected;
//    [self.view addSubview:resumeMoreView];
    
    
    
   //多选
    
//    MRResumeMoreView *resumeMoreView = [[MRResumeMoreView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 200) andContentArray:contentArray];
//    resumeMoreView.selectType = MultipleSelected;
//    [self.view addSubview:resumeMoreView];
    
    
    
    //选择某一项取消别的选项(选择不限，别的选项都取消，选择别的，不限就取消)
    
    MRResumeMoreView *resumeMoreView = [[MRResumeMoreView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 200) andContentArray:contentArray];
    resumeMoreView.selectType = MixSelected;
    resumeMoreView.selectedStr = @"不限";
    [self.view addSubview:resumeMoreView];
    
   
    resumeMoreView.selectedBlock = ^(id selectedContent) {
        if ([selectedContent isKindOfClass:[NSString class]]) {
            NSString *str = selectedContent;
            label.text = str;
        }else if ([selectedContent isKindOfClass:[NSArray class
             ]]){
            NSArray *content = selectedContent;
            label.text = [content componentsJoinedByString:@","];
        }
        
    };
  
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
