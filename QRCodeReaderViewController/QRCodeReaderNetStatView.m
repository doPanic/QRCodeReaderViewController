//
//  QRCodeReaderNetStatView.m
//  QRCodeReaderViewControllerExample
//
//  Created by Reinhard on 26.11.17.
//  Copyright © 2017 Yannick Loriot. All rights reserved.
//

#import "QRCodeReaderNetStatView.h"


#define kDefaultLabelFontSize_iPhone 10.
#define kDefaultLabelFontSize_iPad 13.


@interface QRCodeReaderNetStatView ()


@property (strong, nonatomic) NSString *inactiveNetStatText;

@property (strong, nonatomic) UIColor *inactiveNetStatColor;

@property (strong, nonatomic) NSString *activeNetStatText;

@property (strong, nonatomic) UIColor *activeNetStatColor;


@property (strong, nonatomic, readwrite) UILabel *statLabel;


@end



@implementation QRCodeReaderNetStatView


#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
          inactiveNetStatText:(NSString *)inactiveNetStatText
         inactiveNetStatColor:(UIColor *)inactiveNetStatColor
            activeNetStatText:(NSString *)activeNetStatText
           activeNetStatColor:(UIColor *)activeNetStatColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.inactiveNetStatText = inactiveNetStatText;
        self.inactiveNetStatColor = inactiveNetStatColor;
        self.activeNetStatText = activeNetStatText;
        self.activeNetStatColor = activeNetStatColor;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    }
    
    return self;
}



#pragma mark - Public Methods

- (void)updateNetStat:(eQRCodeReaderNetStat)status {
    if (!self.statLabel.superview) {
        [self addSubview:self.statLabel];
    }
    
    self.statLabel.text = status == kQRCodeReaderNetStat_Inactive ? self.inactiveNetStatText : self.activeNetStatText;
    self.backgroundColor = status == kQRCodeReaderNetStat_Inactive ? self.inactiveNetStatColor : self.activeNetStatColor;
}




#pragma mark - Getters

- (UILabel *)statLabel {
    if (!_statLabel) {
        CGFloat fontSize = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? kDefaultLabelFontSize_iPad : kDefaultLabelFontSize_iPhone;
        _statLabel = [[UILabel alloc] init];
        _statLabel.textColor = [UIColor whiteColor];
        _statLabel.backgroundColor = [UIColor clearColor];
        _statLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _statLabel.textAlignment = NSTextAlignmentCenter;
        _statLabel.font = [UIFont systemFontOfSize:fontSize weight:UIFontWeightThin];
        _statLabel.frame = self.bounds;
    }
    
    return _statLabel;
}





@end
