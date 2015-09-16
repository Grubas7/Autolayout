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
@end

@implementation ViewController

- (IBAction)viewDidTap:(UITapGestureRecognizer *)sender {
    
    self.animatedView.shouldBeExpanded = !self.animatedView.shouldBeExpanded;

    [UIView animateWithDuration:1.0 animations:^{
        [self.animatedView invalidateIntrinsicContentSize];
        [self.view layoutIfNeeded];
    }];
}

@end
