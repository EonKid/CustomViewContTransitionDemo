//
//  Interactor.h
//  CustomViewContTransitionDemo
//
//  Created by Dhruv on 20/11/15.
//  Copyright (c) 2015 codeBrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Interactor : UIPercentDrivenInteractiveTransition <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGRect modalCollapsedFrame;
@property (nonatomic, assign) CGRect modalExpandedFrame;
@property (nonatomic, assign) BOOL isPresenting;
@property (nonatomic, assign) BOOL isInteractive;


@end
