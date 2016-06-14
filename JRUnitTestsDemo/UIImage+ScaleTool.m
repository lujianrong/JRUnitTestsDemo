//
//  UIImage+ScaleTool.m
//  JRUnitTestsDemo
//
//  Created by lujianrong on 16/6/14.
//  Copyright © 2016年 JR. All rights reserved.
//

#import "UIImage+ScaleTool.h"

@implementation UIImage (ScaleTool)
- (UIImage *)scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    return scaledImage;
}
@end
