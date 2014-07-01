//
//  PopinView.m
//  PopinDemo
//
//  Created by Rogerio Araujo on 05/04/13.
//  Copyright (c) 2013 BMobile. All rights reserved.
//

#import "PopinView.h"
#import <QuartzCore/QuartzCore.h>

@interface PopinView () {
    
}

- (CAAnimationGroup *) createAnimation:(UIView *)viewToAnimate
                        withStartPoint:(CGPoint)startPoint
                              endPoint:(CGPoint)endPoint
                               endSize:(CGSize)endSize
                               reverse:(BOOL)reverse
                              duration:(CGFloat)duration
                                offset:(NSInteger)offset;

@end

@implementation PopinView
@synthesize currentView,nextView,viewsArray,currentIndex;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        
        UISwipeGestureRecognizer* gestureRecognizer;
        
        gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                      action:@selector(swipe:)];
        gestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
        
        [self addGestureRecognizer:gestureRecognizer];
        
        gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                      action:@selector(swipe:)];
        gestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
        
        [self addGestureRecognizer:gestureRecognizer];
        
        //添加一个tap点击手势
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        tapGR.numberOfTapsRequired = 1;
        tapGR.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tapGR];
        
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        imageView1.image = [UIImage imageNamed:@"diag.png"];
        imageView1.contentMode = UIViewContentModeScaleToFill;
        
        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        imageView2.image = [UIImage imageNamed:@"icon.png"];
        UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        imageView3.image = [UIImage imageNamed:@"qq.png"];
        UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        imageView4.image = [UIImage imageNamed:@"one.png"];
        
        
        self.viewsArray = @[imageView1,imageView2,imageView3,imageView4];
        
        currentIndex = 0;
        UIImageView *imageView = [self.viewsArray objectAtIndex:currentIndex];
        imageView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        NSLog(@"imageView.center.y = %f ",imageView.center.y);
        
        [self addSubview:imageView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.clipsToBounds = YES;
        
        UISwipeGestureRecognizer* gestureRecognizer;
        
        gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                      action:@selector(swipe:)];
        gestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;

        [self addGestureRecognizer:gestureRecognizer];

        gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                      action:@selector(swipe:)];
        gestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
        
        [self addGestureRecognizer:gestureRecognizer];
        
        
        //添加一个tap点击手势
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        tapGR.numberOfTapsRequired = 1;
        tapGR.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tapGR];

        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        imageView1.image = [UIImage imageNamed:@"diag.png"];
        imageView1.contentMode = UIViewContentModeScaleToFill;
        
        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        imageView2.image = [UIImage imageNamed:@"icon.png"];
        UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        imageView3.image = [UIImage imageNamed:@"qq.png"];
        UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        imageView4.image = [UIImage imageNamed:@"one.png"];
        
        
        self.viewsArray = @[imageView1,imageView2,imageView3,imageView4];
        
        currentIndex = 0;
        UIImageView *imageView = [self.viewsArray objectAtIndex:currentIndex];
        imageView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        
        //NSLog(@"imageView.center.y = %f ",imageView.center.y);

        [self addSubview:imageView];
    }
    return self;
}
-(void)swipe:(UISwipeGestureRecognizer *)recongnizer
{
    CGPoint currentViewStartPoint, currentViewEndPoint;
    CGPoint nextViewStartPoint, nextViewEndPoint;
    
    if (recongnizer.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"swipe up");
        self.currentView = (UIView *)[self.viewsArray objectAtIndex:self.currentIndex];//取得当前视图
        self.currentIndex = [self.viewsArray indexOfObject:self.currentView];
        if ((self.currentIndex -= 1) < 0) {
            self.currentIndex = self.viewsArray.count -1;
        }
        self.nextView = (UIView *)[self.viewsArray objectAtIndex:self.currentIndex];
        
       // _currentView = self.viewsArray[_currentIndex];
        
        [self insertSubview:currentView aboveSubview:nextView];
        
        currentViewEndPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 - 20);
        currentViewStartPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        
        nextViewEndPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        nextViewStartPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height + (64 * 2));
        
        currentView.center = currentViewStartPoint;
        
        currentView.bounds = CGRectMake(0, 0, 64, 64);
        
        currentView.contentMode = UIViewContentModeScaleToFill;
        
        nextView.center = nextViewStartPoint;
        nextView.bounds = CGRectMake(0, 0, 64 * 3, 64 * 3);
        nextView.contentMode = UIViewContentModeScaleToFill;
        [UIView animateWithDuration:0.7 animations:^{
            CAAnimationGroup* group = [self createAnimation:currentView
                                             withStartPoint:currentViewStartPoint
                                                   endPoint:currentViewEndPoint
                                                    endSize:CGSizeMake(0, 0)
                                                    reverse:NO
                                                   duration:0.7f
                                                     offset:15];
            
            
            [currentView.layer addAnimation:group forKey:nil];

        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.7 animations:^{
                CAAnimationGroup *group1 = [self createAnimation:nextView
                                                 withStartPoint:nextViewStartPoint
                                                       endPoint:nextViewEndPoint
                                                        endSize:CGSizeMake(64, 64)
                                                        reverse:NO
                                                       duration:0.7
                                                         offset:15];
                [nextView.layer addAnimation:group1 forKey:nil];
            } completion:nil];
        }];
    }
    else  // 向下滑动处理
    {
        NSLog(@"swipe down");
        self.currentView = [self.viewsArray objectAtIndex:self.currentIndex];//取得当前视图
        self.currentIndex = [self.viewsArray indexOfObject:self.currentView];
        if ((self.currentIndex += 1) > self.viewsArray.count - 1) {
            self.currentIndex = 0;
        }
        
        self.nextView = (UIView *)[self.viewsArray objectAtIndex:self.currentIndex];
        
        [self insertSubview:nextView belowSubview:currentView];
        
        //这里定义的开始点、结束点均是说的每个视图的center
        currentViewEndPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height + 64 * 2);
        currentViewStartPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        
        nextViewEndPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        nextViewStartPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height/2 - 20);
        
        currentView.center = currentViewStartPoint;
        
        currentView.bounds = CGRectMake(0, 0, 64, 64);
        
        currentView.contentMode = UIViewContentModeScaleToFill;
        
        nextView.center = nextViewStartPoint;
        nextView.bounds = CGRectMake(0, 0, 0, 0);
      //nextView.contentMode = UIViewContentModeScaleToFill;
        [UIView animateWithDuration:0.5 animations:^{
            CAAnimationGroup* group = [self createAnimation:currentView
                                             withStartPoint:currentViewStartPoint
                                                   endPoint:currentViewEndPoint
                                                    endSize:CGSizeMake(64 * 3, 64 * 3)
                                                    reverse:NO
                                                   duration:0.5f
                                                     offset:0];
            
            
            [currentView.layer addAnimation:group forKey:nil];
            
        } completion:^(BOOL finished) {
//            currentView.bounds = CGRectMake(0, 0, 0, 0);
//            nextView.bounds = CGRectMake(0, 0, 0, 0);
            [UIView animateWithDuration:0.7 animations:^{
                CAAnimationGroup *group1 = [self createAnimation:nextView
                                                  withStartPoint:nextViewStartPoint
                                                        endPoint:nextViewEndPoint
                                                         endSize:CGSizeMake(64, 64)
                                                         reverse:NO
                                                        duration:0.7
                                                          offset:15];
                [nextView.layer addAnimation:group1 forKey:nil];
            } completion:nil];
        }];
        
    }
}


-(CAAnimationGroup *)createAnimation:(UIView *)viewToAnimate
                      withStartPoint:(CGPoint)startPoint
                            endPoint:(CGPoint)endPoint
                             endSize:(CGSize)endSize
                             reverse:(BOOL)reverse
                            duration:(CGFloat)duration
                              offset:(NSInteger)offset {
    
    CABasicAnimation *resizeAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    [resizeAnimation setToValue:[NSValue valueWithCGSize:endSize]];
    resizeAnimation.fillMode = kCAFillModeForwards;
    resizeAnimation.removedOnCompletion = NO;
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, startPoint.x, startPoint.y);
    if (! reverse)
        CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, startPoint.y,
                              endPoint.x, startPoint.y - offset, endPoint.x, endPoint.y);
    else
        CGPathAddCurveToPoint(curvedPath, NULL, startPoint.x, endPoint.y,
                              startPoint.x, endPoint.y - offset, endPoint.x, endPoint.y);

    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [group setAnimations:[NSArray arrayWithObjects:pathAnimation, resizeAnimation, nil]];
    group.duration = duration;
    group.delegate = self;
    [group setValue:viewToAnimate forKey:@"imageViewBeingAnimated"];

    return group;
}

-(void)tap:(UITapGestureRecognizer *)tapRG
{
    NSLog(@"currentIndex == %li",currentIndex);
    [self.delegate goToSelectedViewController:self.currentIndex];

}
@end
