//
//  ViewController.m
//  HGDQStars
//
//  Created by zhuming on 16/2/22.
//  Copyright © 2016年 zhuming. All rights reserved.
//

#import "ViewController.h"
#import "HGDQStars.h"

@interface ViewController ()<StarRatingViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HGDQStars *view = [[HGDQStars alloc] initWithFrame:CGRectMake(100, 100, 100, 20) currentScore:3 delegate:self];
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)starRatingView:(HGDQStars *)view score:(CGFloat)score{
    NSLog(@"score = %f",score);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
