//
//  ViewController.m
//  CustomViewContTransitionDemo
//
//  Created by Dhruv on 20/11/15.
//  Copyright (c) 2015 codeBrew. All rights reserved.
//

#import "ViewController.h"
#import "CustomModalViewController.h"
#import "Interactor.h"


@interface ViewController ()
@property (nonatomic, strong) Interactor *interactor;

@property (nonatomic, strong) UIButton *button;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(presentModal:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"mabelFlip.jpg"] forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:button];
    self.button = button;
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(150)]-(30)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(30)-[button(150)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
    
    self.interactor = [Interactor new];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if (self.interactor && self.button)
    {
        self.interactor.modalCollapsedFrame = self.button.frame;
    }
}

-(void)presentModal:(UIButton *)sender
{
    CustomModalViewController *modalViewController = [[CustomModalViewController alloc]initWithInteractor:self.interactor];
    modalViewController.modalPresentationStyle = UIModalPresentationCustom;
    modalViewController.transitioningDelegate = self.interactor;
    self.interactor.isPresenting = YES;
    self.interactor.modalCollapsedFrame = sender.frame;
    [self presentViewController:modalViewController animated:YES completion:^{
        self.interactor.isPresenting = NO;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
