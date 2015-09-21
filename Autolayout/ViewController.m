//
//  Created by Adam Grzegorowski on 14/09/15.
//  Copyright © 2015 allegro. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *labels = [NSMutableArray arrayWithCapacity:100];

    for (NSUInteger i=0; i<1000; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"%lu", (unsigned long)i];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:label];
        [labels addObject:label];
    }

    NSUInteger length = 50;
    for (int location = 0; location < labels.count; location+=length) {
        NSRange range = NSMakeRange(location, length);
        NSArray *labelsSubarray = [labels subarrayWithRange:range];
        [self setUpConstraintForSubviews:labelsSubarray topMargin:location];
    }
}

- (void)setUpConstraintForSubviews:(NSArray *)labels topMargin:(NSUInteger)margin {
    UILabel *previusLabel;
    for (UILabel *label in labels) {


        NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[label]"
                                                                               options:0
                                                                               metrics:@{ @"margin" : @(margin)}
                                                                                 views:NSDictionaryOfVariableBindings(label)];
        [self.view addConstraints:verticalConstraints];

        if (labels == labels.firstObject) {
            NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[label]"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:NSDictionaryOfVariableBindings(label)];
            [self.view addConstraints:constraints];
        }
        if (labels == labels.lastObject) {
            NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[label]-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:NSDictionaryOfVariableBindings(label)];
            [self.view addConstraints:constraints];
        }
        if (previusLabel) {
            NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[previusLabel]-[label]"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:NSDictionaryOfVariableBindings(previusLabel, label)];
            [self.view addConstraints:constraints];
        }
        
        previusLabel = label;
    }

}

@end
