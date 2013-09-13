//
//  UIImage+wiRoundedRectImage.h
//  Custom Cell
//
//  Created by nekle on 13-6-10.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (wiRoundedRectImage)

+ (float) radians:(double) degrees ;

+ (void) drawSectorCtx:(CGContextRef) ctx atPoint: (CGPoint) point withR: (float) radius start: (float) angle_start end:( float) angle_end
              color: (UIColor*) color;


+ (void) drawArcCtx:(CGContextRef)ctx atPoint:(CGPoint) point whitR: (CGFloat) radius start:(CGFloat)angle_start end:(CGFloat)angle_end
              color:(UIColor*)color;

+(id)createRoundedRectImage:(UIImage*)img size:(CGSize)size radius:(NSInteger)r;
@end
