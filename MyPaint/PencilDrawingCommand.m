//
//  PencilDrawingCommand.m
//  MyPaint
//
//  Created by Valentina Chernoeva on 15.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "PencilDrawingCommand.h"
#import "DrawingProperty.h"
#import "LineDrawingCommand.h"
#import "CommandExecutor.h"

@interface PencilDrawingCommand ()

@property (strong, nonatomic) CommandExecutor *commandExecutor;

@end

@implementation PencilDrawingCommand

- (instancetype)initWithContext:(CGContextRef)context startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    self = [super initWithContext:context startPoint:startPoint endPoint:endPoint];
    if (self) {
        self.commandExecutor = [[CommandExecutor alloc] init];
    }
    return self;
}

- (instancetype)init {
    return [self initWithContext:nil startPoint:CGPointZero endPoint:CGPointZero];;
}

#pragma mark - DrawingCommandProtocol

- (void)execute {
    LineDrawingCommand *lineCommand = [[LineDrawingCommand alloc] initWithContext:self.context
                                                                       startPoint:self.startPoint
                                                                         endPoint:self.endPoint];
    lineCommand.drawingProperty = self.drawingProperty;
    [self.commandExecutor addCommand:lineCommand];
    [self.commandExecutor executeAll];
    self.startPoint = self.endPoint;
}

@end
