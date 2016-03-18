//
//  DrawingProperty.h
//  MyPaint
//
//  Created by Valentina Chernoeva on 02.03.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DrawingProperty : NSObject <NSCopying>

@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSNumber *lineWidth;

- (instancetype)initWithColor:(UIColor *)color lineWidth:(NSNumber *)lineWidth;

@end
