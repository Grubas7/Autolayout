//
//  Created by Adam Grzegorowski on 14/09/15.
//  Copyright © 2015 allegro. All rights reserved.
//

#import "SampleView.h"

CG_INLINE CGSize CGSizeIntersect(CGSize size1, CGSize size2) {
    return CGSizeMake((CGFloat)fmin(size1.width, size2.width), (CGFloat)fmin(size1.height, size2.height));
}

@interface UIView (sizeThatFitsWithMaxWidth)

- (CGSize)sizeThatFits:(CGSize)size withMaxSize:(CGSize)maxSize;

@end

@implementation UIView (sizeThatFitsWithMaxWidth)

- (CGSize)sizeThatFits:(CGSize)size withMaxSize:(CGSize)maxSize {
    return CGSizeIntersect([self sizeThatFits:size], maxSize);
}

@end

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
    self.rightLabel.text = NSLocalizedString(@"Right right, teraz teraz, leci leci", nil);
    self.rightLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.rightLabel];

    self.leftLabel = [[UILabel alloc] init];
    self.leftLabel.text = NSLocalizedString(@"Left", nil);
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
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    CGSize leftLabelSize = [self.leftLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    CGFloat maxRightLabelWidth = viewWidth - 3.0f * margin - leftLabelSize.width;
    CGSize rightLabelSize = [self.rightLabel sizeThatFits:CGSizeZero withMaxSize:CGSizeMake(maxRightLabelWidth, CGFLOAT_MAX)];

    self.leftLabel.frame = (CGRect){{margin, viewHeight/2.0f}, leftLabelSize};
    self.rightLabel.frame = (CGRect){{CGRectGetMaxX(self.leftLabel.frame) + margin, viewHeight/2.0f}, rightLabelSize};
}

@end
