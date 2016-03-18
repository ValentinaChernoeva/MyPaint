//
//  InteractivePainterView.h
//  MyPaint
//
//  Created by Valentina Chernoeva on 03.02.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ShapeType) {
    ShapeLine,
    ShapeRect,
    ShapePencil
};

@class DrawingProperty;

@interface InteractivePainterView : UIView

@property (strong, nonatomic) DrawingProperty *drawingProperty;
@property (assign, nonatomic) ShapeType shapeType;

- (void)clearView;
- (void)undoCommand;

@end
