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
        [self setUpConstraints];
    }

    return self;
}

- (void)setUpSubviews {
    self.rightLabel = [[UILabel alloc] init];
    self.rightLabel.text = NSLocalizedString(@"Right right, teraz teraz, leci leci", nil);
    self.rightLabel.backgroundColor = [UIColor redColor];
    self.rightLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.rightLabel];

    self.leftLabel = [[UILabel alloc] init];
    self.leftLabel.text = NSLocalizedString(@"Left", nil);
    self.leftLabel.backgroundColor = [UIColor greenColor];
    self.leftLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [self addSubview:self.leftLabel];
}

- (void)setUpConstraints {

    CGFloat margin = 10.0f;

    [self.leftLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:margin].active = YES;
    [self.leftLabel.trailingAnchor constraintEqualToAnchor:self.rightLabel.leadingAnchor constant:-margin].active = YES;
    [self.rightLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-margin].active = YES;

    [self.leftLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    [self.rightLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
}

@end
