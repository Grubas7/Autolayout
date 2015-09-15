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
    CGFloat constant = 0.0f;
    NSArray *attributes = @[
        @(NSLayoutAttributeTop),
        @(NSLayoutAttributeBottom),
        @(NSLayoutAttributeRight),
        @(NSLayoutAttributeLeft)
    ];

    for (NSNumber *attributeAsNumber in attributes) {
        NSLayoutAttribute attribute = attributeAsNumber.integerValue;

        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:sampleView
                                                                     attribute:attribute
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:attribute
                                                                    multiplier:multiplier
                                                                      constant:constant];

        [self.view addConstraint:constraint];
    }
}

@end
