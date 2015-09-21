//
//  UIImage+Util.m
//  Situp
//
//  Created by lepdou on 15/9/20.
//  Copyright (c) 2015年 lepdou. All rights reserved.
//

#import "UIImage+Util.h"

@implementation UIImage(util)

+(UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
