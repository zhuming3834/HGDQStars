//
//  HGDQStars.m
//  HGDQStars
//
//  Created by zhuming on 16/2/22.
//  Copyright © 2016年 zhuming. All rights reserved.
//

#import "HGDQStars.h"

@interface HGDQStars ()
/**
 *  高亮星星
 */
@property (nonatomic,strong)UIView *fullStarsView;
/**
 *  灰色星星
 */
@property (nonatomic,strong)UIView *emptyStarsView;
/**
 *  星星控件的满分值
 */
@property (nonatomic,assign)CGFloat maxScore;
/**
 *  是否可以滑动评分  YES:可以  NO:不可以
 */
@property (nonatomic, assign) BOOL enable;
/**
 *  设置分值
 */
@property (nonatomic,assign)CGFloat score;

@end

@implementation HGDQStars

/**
 *  重写父类的init方法
 *
 *  @param frame                  星星控件的frame
 *  @param currentScore           当前的分值
 *  @param starRatingViewDelegate 代理
 *
 *  @return 星星控件
 */
- (instancetype)initWithFrame:(CGRect)frame currentScore:(CGFloat)currentScore delegate:(id)starRatingViewDelegate{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        self.score = currentScore; // 星星控件的当前分值
        if (starRatingViewDelegate) { // 是否关联带来
            self.delegate = starRatingViewDelegate;
            self.enable = YES; // 是否允许滑动
        }
    }
    return self;
}

/**
 *  初始化视图
 */
- (void)initView{
    self.maxScore = 5;
    self.fullStarsView = [self initStarViewWithImageName:@"icon_fullstar"];
    self.emptyStarsView = [self initStarViewWithImageName:@"icon_emptystar"];
    
    [self addSubview:self.emptyStarsView];
    [self addSubview:self.fullStarsView];
}

/**
 *  生成基本控件
 *
 *  @param imageName 图片名
 *
 *  @return 控件
 */
- (HGDQStars *)initStarViewWithImageName:(NSString *)imageName{
    CGRect frame = self.bounds;
    HGDQStars *view = [[HGDQStars alloc] init];
    view.frame = frame;
    view.clipsToBounds = YES;
    for (int i = 0; i < self.maxScore; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * frame.size.width / self.maxScore, 0, frame.size.width / self.maxScore, frame.size.height);
        [view addSubview:imageView];
    }
    return view;
}
/**
 *  触摸事件
 *
 *  @param touches touches description
 *  @param event   event description
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.fullStarsView.hidden = NO;
    
    if (self.enable) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        if(CGRectContainsPoint(rect,point))
        {
            [self changeStarForegroundViewWithPoint:point];
        }
    }
}
/**
 *  改变分数
 *
 *  @param point 分数
 */
- (void)changeStarForegroundViewWithPoint:(CGPoint)point
{
    if (point.x < 0)
    {
        point.x = 0;
    }
    else if (point.x > self.frame.size.width)
    {
        point.x = self.frame.size.width;
    }
    
    NSString * str = [NSString stringWithFormat:@"%0.2f",point.x / self.frame.size.width];
    float score = [str floatValue];
    point.x = score * self.frame.size.width;
    self.fullStarsView.frame = CGRectMake(0, 0, point.x, self.frame.size.height);
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(starRatingView: score:)])
    {
        [self.delegate starRatingView:self score:score];
    }
}
/**
 *  setter方法
 *
 *  @param score score description
 */
-(void) setScore:(CGFloat) score
{
    float width = score/self.maxScore;
    
    self.fullStarsView.frame = CGRectMake(0, 0, self.frame.size.width * width, self.frame.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
