//
//  Created by Adam Grzegorowski on 14/09/15.
//  Copyright © 2015 allegro. All rights reserved.
//

#import "SampleView.h"

static CGFloat margin = 10.0f;

@interface SampleView ()

@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIStackView *stackView;

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

    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:@[ self.leftLabel, self.rightLabel ]];
    self.stackView.spacing = margin;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.stackView];
}

- (void)setUpConstraints {

    NSLayoutConstraint *stackViewCenterY = [self layoutConstraintCenterYForView:self.stackView];

    [self addConstraints:@[ stackViewCenterY ]];

    NSDictionary *views = @{ @"stackView" : self.stackView };
    NSDictionary *metrics = @{ @"margin" : @(margin) };
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-(margin)-[stackView]-(margin)-|"
                                                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                                                             metrics:metrics
                                                                               views:views];

    [self addConstraints:horizontalConstraints];
}

- (NSLayoutConstraint *)layoutConstraintCenterYForView:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:NSLayoutAttributeCenterY
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                        attribute:NSLayoutAttributeCenterY
                                       multiplier:1.0f
                                         constant:0.0f];
}

@end
