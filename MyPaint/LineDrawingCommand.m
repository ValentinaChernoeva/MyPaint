//
//  LineDrawingCommand.m
//  MyPaint
//
//  Created by Valentina Chernoeva on 08.02.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "LineDrawingCommand.h"
#import "DrawingProperty.h"

@implementation LineDrawingCommand

#pragma mark - DrawingCommandProtocol

- (void)execute {
    CGContextSetLineCap(self.context, kCGLineCapRound);
    CGContextSetLineWidth(self.context, self.drawingProperty.lineWidth.floatValue);
    CGContextSetStrokeColorWithColor(self.context, self.drawingProperty.color.CGColor);
    CGContextBeginPath(self.context);
    CGContextMoveToPoint(self.context, self.startPoint.x, self.startPoint.y);
    CGContextAddLineToPoint(self.context, self.endPoint.x, self.endPoint.y);
    CGContextStrokePath(self.context);
}

@end
