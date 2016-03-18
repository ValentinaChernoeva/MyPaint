//
//  DrawingCommand.h
//  MyPaint
//
//  Created by Valentina Chernoeva on 08.02.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@class DrawingProperty;

@protocol DrawingCommandProtocol <NSObject>

- (void)execute;
- (void)undo;

@end

@interface DrawingCommand : NSObject <DrawingCommandProtocol>

@property (assign, nonatomic) CGContextRef context;
@property (assign, nonatomic) CGPoint startPoint;
@property (assign, nonatomic) CGPoint endPoint;

@property (strong, nonatomic) DrawingProperty *drawingProperty;

- (instancetype)initWithContext:(CGContextRef)context
                     startPoint:(CGPoint)startPoint
                       endPoint:(CGPoint)endPoint;

@end
