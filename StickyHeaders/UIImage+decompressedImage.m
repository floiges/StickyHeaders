//
//  UIImage+decompressedImage.m
//  StickyHeaders
//
//  Created by 224 on 16/1/2.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "UIImage+decompressedImage.h"

@implementation UIImage (decompressedImage)

- (UIImage *)decompressedImage {
    UIGraphicsBeginImageContextWithOptions(self.size, true, 0);
    [self drawAtPoint:CGPointZero];
    UIImage *decompressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return decompressedImage;
}

@end
