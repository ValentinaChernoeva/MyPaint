//
//  RectDrawingCommand.m
//  MyPaint
//
//  Created by Valentina Chernoeva on 08.02.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "RectDrawingCommand.h"
#import "DrawingProperty.h"

@interface RectDrawingCommand ()

@property (readonly) CGRect rect;

@end

@implementation RectDrawingCommand

#pragma mark - DrawingCommandProtocol

- (void)execute {
    CGContextSetLineCap(self.context, kCGLineCapRound);
    CGContextSetLineWidth(self.context, self.drawingProperty.lineWidth.floatValue);
    CGContextSetStrokeColorWithColor(self.context, self.drawingProperty.color.CGColor);
    CGContextBeginPath(self.context);
    CGContextAddRect(self.context, self.rect);
    CGContextStrokePath(self.context);
}

#pragma mark - Accessor methods

- (CGRect)rect {
    CGFloat startX = self.startPoint.x;
    CGFloat finishX = self.endPoint.x;
    
    if (self.startPoint.x > self.endPoint.x) {
        startX = self.endPoint.x;
        finishX = self.startPoint.x;
    }
    
    return CGRectMake(startX, self.startPoint.y, finishX - startX, self.endPoint.y - self.startPoint.y);
}

@end
