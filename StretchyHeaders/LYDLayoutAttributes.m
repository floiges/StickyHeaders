//
//  LYDLayoutAttributes.m
//  StretchyHeaders
//
//  Created by 224 on 16/1/1.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "LYDLayoutAttributes.h"

@implementation LYDLayoutAttributes

- (id)copyWithZone:(NSZone *)zone {
    LYDLayoutAttributes *copy = [super copyWithZone:zone];
    copy.deltaY = self.deltaY;
    return copy;
}

- (BOOL)isEqual:(id)object {
    LYDLayoutAttributes * attributes = (LYDLayoutAttributes *)object;
    if (attributes.deltaY == self.deltaY) {
        return [super isEqual:object];
    }else {
        return false;
    }
}

@end
