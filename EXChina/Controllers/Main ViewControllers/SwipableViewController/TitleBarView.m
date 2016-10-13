//
//  TitleBarView.m
//  EXChina
//
//  Created by Chia on 16/9/22.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import "TitleBarView.h"
#import "UIColor+Util.h"

@interface TitleBarView()
@property (strong, nonatomic) NSMutableArray *titleButtons;

@end
@implementation TitleBarView

-(NSMutableArray *)titleButtons{
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles{
    self = [super initWithFrame:frame];
    if (self) {
        
        _currentIndex = 0;
        CGFloat buttonW = frame.size.width / titles.count;
        CGFloat buttonH = frame.size.height;
        NSInteger idx = 0;
        for (NSString *title in titles) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:title forState:UIControlStateNormal];
            button.frame = CGRectMake(buttonW * idx, 0, buttonW, buttonH);
            
            button.backgroundColor = [UIColor titleBarColor];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitleColor:[UIColor colorWithHex:0x909090] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = idx;
            idx ++;
            
            [self addSubview:button];
            [self.titleButtons addObject:button];
            [self sendSubviewToBack:button];
        }
        self.contentSize = CGSizeMake(frame.size.width, 35);
        self.showsHorizontalScrollIndicator = NO;
        //初始值，默认选中的是第一个按钮
        UIButton *firstTitle = _titleButtons[0];
        [firstTitle setTitleColor:[UIColor newSectionButtonSelectedColor] forState:UIControlStateNormal];
    }
    return self;
}

-(void)clickButton:(UIButton *)button{
    if (_currentIndex != button.tag) {//说明被选中的不是当前按钮
        //保存当前按钮，设置回普通样式
        UIButton *preTitle = _titleButtons[_currentIndex];
        [preTitle setTitleColor:[UIColor colorWithHex:0x909090] forState:UIControlStateNormal];
        //将选中的按钮设置成选中样式，并保存到当前按钮状态
        [button setTitleColor:[UIColor newSectionButtonSelectedColor] forState:UIControlStateNormal];
        
        _currentIndex = button.tag;
    }
}
@end
