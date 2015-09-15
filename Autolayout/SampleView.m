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

    NSLayoutConstraint *leftLabelCenterY = [self layoutConstraintCenterYForView:self.leftLabel];
    NSLayoutConstraint *rightLabelCenterY = [self layoutConstraintCenterYForView:self.rightLabel];

    [self addConstraints:@[ leftLabelCenterY, rightLabelCenterY ]];

    NSDictionary *views = @{ @"leftLabel" : self.leftLabel, @"rightLabel" : self.rightLabel };
    NSDictionary *metrics = @{ @"margin" : @10 };
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-(margin)-[leftLabel]-(margin)-[rightLabel]-(margin)-|"
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
