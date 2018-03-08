//
//  MRResumeMoreView.m
//  Home
//
//  Created by hello on 2018/1/16.
//  Copyright © 2018年 zyj. All rights reserved.
//

#import "MRResumeMoreView.h"

@implementation MRResumeMoreView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame andContentArray:(NSArray*)contentArray{
    if (self = [super initWithFrame:frame]) {
        
        self.selectedArray = [NSMutableArray array];
        
        CGFloat m = (self.frame.size.width-24-320)/3;
        for (int i = 0; i < contentArray.count; i++) {
            UIButton *button = [UIButton    buttonWithType:UIButtonTypeCustom];
            button.tag = 100+i;
            button.frame = CGRectMake(12+(80+m)*(i%4),(47)*(i/4), 80, 37);
            NSString *str = [contentArray objectAtIndex:i];
            [button setTitle:str forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 5.0;
            button.layer.borderColor = [[UIColor grayColor] CGColor];
            button.layer.borderWidth = 0.5;
            [button addTarget:self action:@selector(selectTag:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            
        }
    }
    return self;
}



#pragma  ----- selectTag:
- (void)selectTag:(UIButton*)button{
 
    if(self.selectType == OneSelected){
        _selectedButton.selected = NO;
        button.selected = YES;
        _selectedButton = button;
        self.selectedBlock(button.currentTitle);
    }else if (self.selectType == MultipleSelected){
        button.selected = !button.selected;
        if (button.selected) {
          [self.selectedArray addObject:button.currentTitle];
        }else{
            [self.selectedArray removeObject:button.currentTitle];
        }
        self.selectedBlock(self.selectedArray);
        
    }else if (self.selectType == MixSelected){
        button.selected = !button.selected;
        if (button.selected) {
            if ([button.currentTitle isEqualToString:self.selectedStr]) {
                [self.selectedArray removeAllObjects];
                for (UIButton *btn in self.subviews) {
                    if (![btn.currentTitle isEqualToString:self.selectedStr]) {
                        btn.selected = NO;
                    }
                }
            }else{
                for (UIButton *btn in self.subviews) {
                    if ([btn.currentTitle isEqualToString:self.selectedStr]) {
                        btn.selected = NO;
                        [self.selectedArray removeObject:btn.currentTitle];
                    }
                }
            }
            [self.selectedArray addObject:button.currentTitle];
        }else{
            [self.selectedArray removeObject:button.currentTitle];
        }
        
        self.selectedBlock(self.selectedArray);
    }
    
}


@end
