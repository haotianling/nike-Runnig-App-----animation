//
//  PopinView.h
//  PopinDemo
//
//  Created by Rogerio Araujo on 05/04/13.
//  Copyright (c) 2013 BMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopinViewDelegate <NSObject>

-(void)goToSelectedViewController:(NSInteger)selectedIndex;

@end

@interface PopinView : UIView

@property (nonatomic,strong) UIView *currentView;
@property (nonatomic,strong )UIView *nextView;
@property (nonatomic) NSInteger currentIndex;
@property (nonatomic) NSArray *viewsArray;

@property (nonatomic,assign) id<PopinViewDelegate> delegate;

@end
