//
//  JKTCustomShapedButton.m
//  JKTCustomShapedButton
//
//  Created by Jeethu on 17/07/14.
//  Copyright (c) 2014 JKT. All rights reserved.
//

#import "JKTCustomShapedButton.h"
#import "UIImage+AlphaCheck.h"
@implementation JKTCustomShapedButton
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

#pragma mark - Hit testing
- (BOOL)isAlphaVisibleAtPoint:(CGPoint)point forImage:(UIImage *)image
{
    point.x *= (self.bounds.size.width != 0) ? (image.size.width / self.bounds.size.width) : 1;
    point.y *= (self.bounds.size.height != 0) ? (image.size.height / self.bounds.size.height) : 1;
    UIColor *pixelAlpha = [image alphaValueAtPoint:point];
    CGFloat alpha = 0.0;
    if ([pixelAlpha respondsToSelector:@selector(getRed:green:blue:alpha:)])
    {
        [pixelAlpha getRed:NULL green:NULL blue:NULL alpha:&alpha];
    }
    else
    {
        CGColorRef pointPixelAlpha = [pixelAlpha CGColor];
        alpha = CGColorGetAlpha(pointPixelAlpha);
    }
    return alpha >= 0.1f;
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    [super pointInside:point withEvent:event];
    if ([self isAlphaVisibleAtPoint:point forImage:[self currentImage]])
    {
        return  YES;
    }
    else
    {
        return [self isAlphaVisibleAtPoint:point forImage:[self currentBackgroundImage]];
    }
    return NO;
}
@end
