//
//  ViewController.m
//  Autolayout
//
//  Created by Adam Grzegorowski on 14/09/15.
//  Copyright © 2015 allegro. All rights reserved.
//

#import "ViewController.h"
#import "SampleView.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *sampleView = [[SampleView alloc] init];
    [self.view addSubview:sampleView];
}

@end
