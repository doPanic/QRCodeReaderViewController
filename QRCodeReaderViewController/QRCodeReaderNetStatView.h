//
//  QRCodeReaderNetStatView.h
//  QRCodeReaderViewControllerExample
//
//  Created by Reinhard on 26.11.17.
//  Copyright © 2017 Yannick Loriot. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    kQRCodeReaderNetStat_Active,
    kQRCodeReaderNetStat_Inactive
}eQRCodeReaderNetStat;




@interface QRCodeReaderNetStatView : UIView


@property (strong, nonatomic, readonly, nonnull) UILabel *statLabel;


- (nonnull instancetype)initWithFrame:(CGRect)frame
                  inactiveNetStatText:(nullable NSString *)inactiveNetStatText
                 inactiveNetStatColor:(nullable UIColor *)inactiveNetStatColor
                    activeNetStatText:(nullable NSString *)activeNetStatText
                   activeNetStatColor:(nullable UIColor *)activeNetStatColor;




- (void)updateNetStat:(eQRCodeReaderNetStat)status;



@end
