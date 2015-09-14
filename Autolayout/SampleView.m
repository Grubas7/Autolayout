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

    [self layoutLeftLabel];
    [self layoutRightLabel];

    // 1. autoresizingMask
    self.leftLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.rightLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    // 2. manual layout
//    [self layoutLeftLabel];
//    [self layoutRightLabel];
}

- (void)layoutRightLabel {

    CGFloat height = CGRectGetHeight(self.frame);

    self.rightLabel.frame = CGRectMake(120.0f, height/2.0f, 100.0f, 100.0f);
    [self.rightLabel sizeToFit];
}

- (void)layoutLeftLabel {

    CGFloat height = CGRectGetHeight(self.frame);

    self.leftLabel.frame = CGRectMake(10.0f, height/2.0f, 100.0f, 100.0f);
    [self.leftLabel sizeToFit];
}

@end
