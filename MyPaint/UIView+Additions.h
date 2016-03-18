//
//  UIView+Additions.h
//  LunchDelivery-Client
//
//  Created by Alexander Anisimov on 03/09/15.
//  Copyright (c) 2015 Magora Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;

+ (UINib *)nib;
+ (instancetype)createFromNib;
+ (NSString *)reuseIdentifier;
+ (CGFloat)defaultHeight;

- (void)addShadow;

@end
