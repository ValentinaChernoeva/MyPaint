//
//  UIView+Additions.m
//  LunchDelivery-Client
//
//  Created by Alexander Anisimov on 03/09/15.
//  Copyright (c) 2015 Magora Systems. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)
@dynamic borderColor,borderWidth,cornerRadius;

- (void)setBorderColor:(UIColor *)borderColor {
    [self.layer setBorderColor:borderColor.CGColor];
    [self.layer setMasksToBounds:YES];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    [self.layer setBorderWidth:borderWidth];
    [self.layer setMasksToBounds:YES];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    [self.layer setCornerRadius:cornerRadius];
    [self.layer setMasksToBounds:YES];
}

+ (instancetype)createFromNib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] firstObject];
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

+ (UINib *)nib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

+ (CGFloat)defaultHeight {
    return 0;
}

- (void)addShadow {
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowRadius = 1.f;
    self.layer.shadowOpacity = 0.3f;
}

@end

@implementation UITableViewCell (UIViewAdditions)

+ (CGFloat)defaultHeight {
    return 44.0;
}

@end
