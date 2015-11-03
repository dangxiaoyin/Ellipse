//
//  ViewController.m
//  Ellipse(练习)
//
//  Created by Mac on 15-3-24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int angle;
    UIImageView *moonImageView;
    NSMutableArray *array;
}



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    Ellipse  椭圆
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
//    创建地球
    UIImageView *earthImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130, 100)];
    earthImageView.center = self.view.center;
    earthImageView.image = [UIImage imageNamed:@"earth.jpg"];
    [self.view addSubview:earthImageView];
    
    
//    创建月亮
    
    
//    数组
    array = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 1; i<11; i++)
    {
        moonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        moonImageView.tag = 36 * i;
        
        
//        int x = self.view.center.x + 120 * cos(angle *M_PI/180);
//        int y = self.view.center.y + 100 * sin(angle *M_PI/180);

        moonImageView.center = CGPointMake(self.view.center.x + 120 * cos(moonImageView.tag * M_PI/180), self.view.center.y + 120 * sin(moonImageView.tag * M_PI/180) );
        
        moonImageView.image = [UIImage imageNamed:@"moon.jpg"];
        [array addObject:moonImageView];
        [self.view addSubview:moonImageView];

    }

    
//    创建定时器  使月亮运动
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"BTN" forState:UIControlStateNormal];
    btn.frame = CGRectMake(50, 50, 100, 50);
    [self.view addSubview:btn];
    
    
    
    
}



-(void)onTimer
{
    //    椭圆参数方程
    //    int x ＝ 中心点x ＋ 长半轴＊cos（角度／弧度）；
    //    int y ＝ 中心点y ＋ 短半轴＊sin（角度／弧度）；
    
    for (UIImageView *moon in array)
    {
        int x = self.view.center.x + 120 * cos(moon.tag * M_PI/180);
        int y = self.view.center.y + 120 * sin(moon.tag * M_PI/180);
        
        moon.tag += 10;
        moon.center = CGPointMake(x, y);
    }

}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
