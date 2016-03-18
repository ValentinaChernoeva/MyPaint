//
//  CommandExecutor.h
//  MyPaint
//
//  Created by Valentina Chernoeva on 08.02.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DrawingCommandProtocol;

@interface CommandExecutor : NSObject

- (void)addCommand:(id<DrawingCommandProtocol>)command;
- (void)removeCommand:(id<DrawingCommandProtocol>)command;

- (void)executeCommand:(id<DrawingCommandProtocol>)command;
- (void)executeAll;

- (void)undo;
- (void)undoAll;

@end
