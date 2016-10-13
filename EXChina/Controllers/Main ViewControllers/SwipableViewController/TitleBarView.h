//
//  TitleBarView.h
//  EXChina
//
//  Created by Chia on 16/9/22.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleBarView : UIScrollView

@property (assign, nonatomic) NSInteger currentIndex;

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles;

@end
