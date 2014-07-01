//
//  ViewController.m
//  NikeRunningAnimationDemo
//
//  Created by haotian on 14-6-30.
//  Copyright (c) 2014年 Baseus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize popView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    popView.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)goToSelectedViewController:(NSInteger)selectedIndex
{
    NSLog(@"goToSelectedViewController was selected! selectIndex == %li",selectedIndex);
}
@end
