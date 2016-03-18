//
//  CommandExecutor.m
//  MyPaint
//
//  Created by Valentina Chernoeva on 08.02.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "CommandExecutor.h"
#import "DrawingCommands.h"

@interface CommandExecutor ()

@property (strong, nonatomic) NSMutableArray <DrawingCommandProtocol> *commands;

@end

@implementation CommandExecutor
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.commands = [NSMutableArray array];
    }
    return self;
}
- (void)addCommand:(id<DrawingCommandProtocol>)command {
    [self.commands addObject:command];
}

- (void)removeCommand:(id<DrawingCommandProtocol>)command {
    [self.commands removeObject:command];
}

- (void)executeCommand:(id<DrawingCommandProtocol>)command {
    [command execute];
}

- (void)executeAll {
    for (id<DrawingCommandProtocol> command in self.commands) {
        [command execute];
    }
}

- (void)undo {
    [self.commands removeLastObject];
    for (id<DrawingCommandProtocol> command in self.commands) {
        [command undo];
    }
    [self executeAll];
}

- (void)undoAll {
    for (id<DrawingCommandProtocol> command in self.commands) {
        [command undo];
    }
    [self.commands removeAllObjects];
}

@end
