//
//  HGDQStars.h
//  HGDQStars
//
//  Created by zhuming on 16/2/22.
//  Copyright © 2016年 zhuming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HGDQStars;

@protocol StarRatingViewDelegate <NSObject>

@optional
/**
 *  代理方法
 *
 *  @param view  星星视图
 *  @param score 当前分值
 */
-(void)starRatingView:(HGDQStars *)view score:(CGFloat)score;

@end

@interface HGDQStars : UIView

/**
 *  重写父类的init方法
 *
 *  @param frame                  星星控件的frame
 *  @param currentScore           当前的分值
 *  @param starRatingViewDelegate 代理
 *
 *  @return 星星控件
 */
- (instancetype)initWithFrame:(CGRect)frame currentScore:(CGFloat)currentScore delegate:(id)starRatingViewDelegate;


@property (nonatomic, weak) id <StarRatingViewDelegate> delegate;

@end
