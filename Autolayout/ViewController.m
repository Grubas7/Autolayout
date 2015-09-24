//
//  Created by Adam Grzegorowski on 14/09/15.
//  Copyright © 2015 allegro. All rights reserved.
//

#import "ViewController.h"
#import "SampleView.h"
#import <Masonry/Masonry.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *sampleView = [[SampleView alloc] init];
    sampleView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sampleView];

    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sampleView);
    }];
}

@end
