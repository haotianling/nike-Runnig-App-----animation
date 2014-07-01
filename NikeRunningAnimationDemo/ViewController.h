//
//  ViewController.h
//  NikeRunningAnimationDemo
//
//  Created by haotian on 14-6-30.
//  Copyright (c) 2014年 Baseus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopinView.h"
@interface ViewController : UIViewController<PopinViewDelegate>
@property (weak, nonatomic) IBOutlet PopinView *popView;

@end
