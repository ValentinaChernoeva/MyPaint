//
//  DrawingProperty.m
//  MyPaint
//
//  Created by Valentina Chernoeva on 02.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "DrawingProperty.h"

@implementation DrawingProperty

- (instancetype)initWithColor:(UIColor *)color lineWidth:(NSNumber *)lineWidth {
    self = [super init];
    if (self) {
        self.color = color;
        self.lineWidth = lineWidth;
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(nullable NSZone *)zone {
    DrawingProperty *newDrawingProperty = [[DrawingProperty allocWithZone:zone] init];
    newDrawingProperty.color = self.color;
    newDrawingProperty.lineWidth = self.lineWidth;
    return newDrawingProperty;
}

@end
