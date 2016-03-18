//
//  DrawingCommand.m
//  MyPaint
//
//  Created by Valentina Chernoeva on 08.02.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "DrawingCommand.h"

@implementation DrawingCommand

- (instancetype)initWithContext:(CGContextRef)context
                     startPoint:(CGPoint)startPoint
                       endPoint:(CGPoint)endPoint {
    self = [super init];
    if (self) {
        self.context = context;
        self.startPoint = startPoint;
        self.endPoint = endPoint;
    }
    return self;
}

#pragma mark - DrawingCommandProtocol

- (void)execute {
    
}

- (void)undo {
    CGContextSetBlendMode(self.context, kCGBlendModeNormal);
}

@end
