//
//  Created by Adam Grzegorowski on 14/09/15.
//  Copyright © 2015 allegro. All rights reserved.
//

#import "ViewController.h"
#import "SampleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *sampleView = [[SampleView alloc] init];
    sampleView.backgroundColor = [UIColor blueColor];
    sampleView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:sampleView];

    CGFloat multiplier = 1.0f;
    CGFloat constant = 10.0f;

    NSLayoutConstraint *topMargin = [NSLayoutConstraint constraintWithItem:sampleView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:multiplier
                                                                  constant:constant];

    NSLayoutConstraint *bottomMargin = [NSLayoutConstraint constraintWithItem:sampleView
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:multiplier
                                                                     constant:-constant];

    NSLayoutConstraint *rightMargin = [NSLayoutConstraint constraintWithItem:sampleView
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:multiplier
                                                                  constant:-constant];

    NSLayoutConstraint *leftMargin = [NSLayoutConstraint constraintWithItem:sampleView
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:multiplier
                                                                  constant:constant];

    [self.view addConstraints:@[ topMargin, bottomMargin, rightMargin, leftMargin ]];
}

@end
