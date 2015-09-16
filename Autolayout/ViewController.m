//
//  ViewController.m
//  Autolayout
//
//  Created by Adam Grzegorowski on 14/09/15.
//  Copyright © 2015 allegro. All rights reserved.
//

#import "ViewController.h"
#import "AnimatedView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet AnimatedView *animatedView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@end

@implementation ViewController

- (IBAction)viewDidTap:(UITapGestureRecognizer *)sender {
    
    self.animatedView.shouldBeExpanded = !self.animatedView.shouldBeExpanded;
    CGFloat height = self.animatedView.shouldBeExpanded ? 300.0f : 50.0f;

    [UIView animateWithDuration:1.0 animations:^{
        self.heightConstraint.constant = height;
        [self.view layoutIfNeeded];
    }];
}

@end
