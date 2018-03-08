//
//  MRResumeMoreView.h
//  Home
//
//  Created by hello on 2018/1/16.
//  Copyright © 2018年 zyj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    OneSelected, //单选
    MultipleSelected,//多选
    MixSelected,//选择某一项取消别的选项
} SelectType;


@interface MRResumeMoreView : UIView

{
    UIButton *_selectedButton;
}

@property (nonatomic, assign) SelectType selectType;

//便于混合时使用  选择不限，别的选项都取消，选择别的，不限就取消
@property (nonatomic, strong) NSString* selectedStr;

@property (nonatomic, strong) NSMutableArray *selectedArray;

-(instancetype)initWithFrame:(CGRect)frame andContentArray:(NSArray*)contentArray;

@property (nonatomic, copy) void (^selectedBlock) (id selectedContent);

@end
