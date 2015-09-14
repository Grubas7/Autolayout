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
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self layoutLabels];
}

- (void)layoutLabels {
    static CGFloat margin = 10.0f;
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    CGSize leftLabelSize = [self.leftLabel sizeThatFits:CGSizeZero];
    CGSize rightLabelSize = [self.rightLabel sizeThatFits:CGSizeZero];

    self.leftLabel.frame = (CGRect){{margin, viewHeight/2.0f}, leftLabelSize};
    self.rightLabel.frame = (CGRect){{CGRectGetMaxX(self.leftLabel.frame) + margin, viewHeight/2.0f}, rightLabelSize};
}

@end
