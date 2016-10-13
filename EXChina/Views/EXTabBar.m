//
//  EXTabBar.m
//  EXChina
//
//  Created by Chia on 16/9/12.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import "EXTabBar.h"
#import "UIView+Category.h"
#import "UIColor+Util.h"

@interface EXTabBar()
@property(nonatomic, weak) UIButton *createBtn;

@end
@implementation EXTabBar

//在init时添加发布按钮
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        //创建发布按钮
        UIButton *createBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [createBtn setImage:[UIImage imageNamed:@"ic_nav_add"] forState:UIControlStateNormal];
        [createBtn setImage:[UIImage imageNamed:@"ic_nav_add_actived"] forState:UIControlStateSelected];
        createBtn.size = createBtn.currentImage.size;
        [createBtn addTarget:self action:@selector(clickCreateBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:createBtn];
        self.createBtn = createBtn;
    }
    return self;
}
//重写layoutSubviews方法，调整按钮位置
-(void)layoutSubviews{
    CGFloat itemW = self.width / 5;
    NSInteger index = 0;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            view.x = itemW *index;
            index++;
        }
        if (index == 2) {
            index++;
        }
    }
    //设置发布按钮的位置
    self.createBtn.centerX = self.width *0.5;
    self.createBtn.centerY = self.height *0.5;
    
}

-(void)clickCreateBtn{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickCreateBtn:)]) {
        [self.delegate tabBarDidClickCreateBtn:self];
    }
}

@end
