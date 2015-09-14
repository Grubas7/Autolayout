//
//  OldView.m
//  Autolayout
//
//  Created by Adam Grzegorowski on 14/09/15.
//  Copyright © 2015 allegro. All rights reserved.
//

#import "SampleView.h"

@interface SampleView ()

@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UILabel *leftLabel;

@end

@implementation SampleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setUpSubviews];
    }

    return self;
}

- (void)setUpSubviews {
    self.rightLabel = [[UILabel alloc] init];
    self.rightLabel.text = @"Right";
    self.rightLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.rightLabel];

    self.leftLabel = [[UILabel alloc] init];
    self.leftLabel.text = @"Left";
    self.leftLabel.backgroundColor = [UIColor greenColor];
    [self addSubview:self.leftLabel];

//    [self layoutLeftLabel];
//    [self layoutRightLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self layoutLeftLabel];
    [self layoutRightLabel];
}

- (void)layoutRightLabel {
    self.rightLabel.frame = CGRectMake(10.0f, 300.0f, 100.0f, 100.0f);
}

- (void)layoutLeftLabel {
    self.leftLabel.frame = CGRectMake(120.0f, 300.0f, 100.0f, 100.0f);
}

@end
