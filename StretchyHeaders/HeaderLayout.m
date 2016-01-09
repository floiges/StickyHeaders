//
//  HeaderLayout.m
//  StretchyHeaders
//
//  Created by 224 on 16/1/1.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "HeaderLayout.h"
#import "LYDLayoutAttributes.h"

@implementation HeaderLayout

+ (Class)layoutAttributesClass {
    return [LYDLayoutAttributes class];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *layoutAttributes = [super layoutAttributesForElementsInRect:rect];
    CGPoint offset = self.collectionView.contentOffset;
    UIEdgeInsets inset = self.collectionView.contentInset;
    CGFloat minY = -inset.top;
    //向下拉，offset.y 为负值，向上为正值
    if (offset.y < minY) {
        CGFloat deltaY = fabs(offset.y - minY);
        //遍历找出 header 对应的 attributes，然后设置他的 frame
        for (LYDLayoutAttributes *attributes in layoutAttributes) {
            NSString *elementKind = attributes.representedElementKind;
            if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
                attributes.deltaY = deltaY;
                CGRect frame = attributes.frame;
                frame.size.height = MIN(MAX(minY, self.headerReferenceSize.height + deltaY), self.maximumStrechHeight);
                frame.origin.y = CGRectGetMinY(frame) - deltaY;
                attributes.frame = frame;
            }
        }
    }
    
    return layoutAttributes;
}

//告诉 layout 对象，当 collection View 的 bounds 发生改变时，需要更新 layout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
