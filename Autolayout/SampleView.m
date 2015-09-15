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
    [self addSubview:self.leftLabel];
}

- (void)setUpConstraints {

    CGFloat margin = 10.0f;
    NSLayoutConstraint *leftLabelCenterY = [NSLayoutConstraint constraintWithItem:self.leftLabel
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:1.0f
                                                                         constant:0.0f];

    NSLayoutConstraint *leftLabelMinX = [NSLayoutConstraint constraintWithItem:self.leftLabel
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeLeading
                                                                    multiplier:1.0f
                                                                      constant:margin];

    [self addConstraints:@[ leftLabelCenterY, leftLabelMinX ]];

    NSLayoutConstraint *rightLabelCenterY = [NSLayoutConstraint constraintWithItem:self.rightLabel
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.0f
                                                                          constant:0.0f];

    NSLayoutConstraint *rightLabelMinX = [NSLayoutConstraint constraintWithItem:self.rightLabel
                                                                      attribute:NSLayoutAttributeLeading
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.leftLabel
                                                                      attribute:NSLayoutAttributeTrailing
                                                                     multiplier:1.0f
                                                                       constant:margin];

    NSLayoutConstraint *rightLabelMaxX = [NSLayoutConstraint constraintWithItem:self.rightLabel
                                                                      attribute:NSLayoutAttributeTrailing
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeTrailing
                                                                     multiplier:1.0f
                                                                       constant:-margin];
    
    [self addConstraints:@[ rightLabelCenterY, rightLabelMinX, rightLabelMaxX ]];
}

@end
