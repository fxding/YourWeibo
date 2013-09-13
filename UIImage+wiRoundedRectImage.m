//
//  UIImage+wiRoundedRectImage.m
//  Custom Cell
//
//  Created by nekle on 13-6-10.
//
//

#import "UIImage+wiRoundedRectImage.h"

#define PI 3.14159265358979323846
//#define radius 100

@implementation UIImage (wiRoundedRectImage)



+ (float) radians:(double) degrees {
    return degrees * PI / 180;
}

+ (void) drawSectorCtx:(CGContextRef) ctx
               atPoint: (CGPoint) point
                 withR: (float) radius
                 start: (float) angle_start
                   end:( float) angle_end
                 color: (UIColor*) color

{
    
    CGContextMoveToPoint(ctx, point.x, point.y);
    CGContextSetFillColor(ctx, CGColorGetComponents( [color CGColor]));
    
    CGContextAddArc(ctx, point.x, point.y, radius,  angle_start, angle_end, 0);
    CGContextFillPath(ctx);

    
}

+ (void) drawArcCtx:(CGContextRef)ctx
            atPoint:(CGPoint) point
              whitR: (CGFloat) radius
              start:(CGFloat)angle_start
                end:(CGFloat)angle_end
              color:(UIColor*)color
{
    
   // [color setStroke];
    
    UIGraphicsPushContext(ctx);
	CGContextBeginPath(ctx);
	CGContextAddArc(ctx, point.x, point.y, radius, angle_start, angle_end, 0);
	CGContextStrokePath(ctx);
	UIGraphicsPopContext();
}


static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{

    float fw, fh;
    
    if (ovalWidth == 0 || ovalHeight == 0)
    {
        CGContextAddRect(context, rect);
        return;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    
    fw = CGRectGetWidth(rect)/ovalWidth;
    fh = CGRectGetHeight(rect)/ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);

}


+(id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r
{
    int w = size.width;
    int h = size.height;
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, r, r);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    
    /////
    CGPoint point = CGPointMake(w/2+0.5, h/2+0.4);
    CGContextSetLineWidth(context, 5);
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
    //CGContextSetFillColor(context, CGColorGetComponents( [[UIColor redColor] CGColor]));
    [UIImage drawArcCtx:context atPoint:point whitR:w/2 start:0 end:360*3.14 color:[UIColor redColor]];
    
    /////
    
    
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    
    img = [UIImage imageWithCGImage:imageMasked];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    
    
    
    return  img;
}

@end
