//
//  InteractivePainterView.m
//  MyPaint
//
//  Created by Valentina Chernoeva on 03.02.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "InteractivePainterView.h"
#import "CommandExecutor.h"
#import "DrawingCommands.h"
#import "DrawingProperty.h"

@interface InteractivePainterView()

@property (strong, nonatomic) CommandExecutor *commandExecutor;
@property (strong, nonatomic) DrawingCommand *currentCommand;
@property (assign, nonatomic) CGContextRef context;
@property (assign, nonatomic) CGPoint startPoint;
@property (assign, nonatomic) CGPoint endPoint;

@end

@implementation InteractivePainterView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:panGesture];
    self.commandExecutor = [[CommandExecutor alloc] init];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    [self.commandExecutor executeAll];
    [self.commandExecutor executeCommand:self.currentCommand];
    self.context = context;
}

- (void)clearView {
    [self.commandExecutor undoAll];
    [self setNeedsDisplay];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                           forView:self
                             cache:NO];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.5f];
    [UIView commitAnimations];
}

- (void)undoCommand {
    [self.commandExecutor undo];
    [self setNeedsDisplay];
}

#pragma mark - Gestures

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:self];
    
    switch(recognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.startPoint = location;
            Class commandClass = [self currentCommandClass];
            self.currentCommand = [[commandClass alloc] initWithContext:self.context
                                                             startPoint:self.startPoint
                                                               endPoint:self.endPoint];
            
            break;
            
        case UIGestureRecognizerStateChanged:
            self.endPoint = location;
            self.currentCommand.endPoint = self.endPoint;
            [self setNeedsDisplay];
            break;
            
        case UIGestureRecognizerStateEnded:{
            self.endPoint = location;
            [self.commandExecutor addCommand:self.currentCommand];
            self.currentCommand = nil;
            [self setNeedsDisplay];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - Help methods

- (Class)currentCommandClass {
    Class aClass = nil;
    
    switch (self.shapeType) {
            
        case ShapeLine:
            aClass = [LineDrawingCommand class];
            break;
            
        case ShapeRect:
            aClass = [RectDrawingCommand class];
            break;
            
        case ShapePencil:
            aClass = [PencilDrawingCommand class];
            break;
            
        default:
            break;
    }
    return aClass;
}

#pragma mark - Accessor methods

- (void)setCurrentCommand:(DrawingCommand *)currentCommand {
    _currentCommand = currentCommand;
    _currentCommand.drawingProperty = [self.drawingProperty copy];
}


@end
