//
//  StickyHeadersLayout.m
//  StickyHeaders
//
//  Created by 224 on 16/1/2.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "StickyHeadersLayout.h"

@implementation StickyHeadersLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return true;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    //先调用 super，只返回当前可见 elements 的 attributes，包括 cells, supplementary views, 和 decoration views
    NSMutableArray *layoutAttributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    NSMutableIndexSet *headerNeedingLayout = [NSMutableIndexSet indexSet];
    //找出当前 cell 对应的 section 索引
    for (UICollectionViewLayoutAttributes *attributes in layoutAttributes) {
        if (attributes.representedElementCategory == UICollectionElementCategoryCell) {
            [headerNeedingLayout addIndex:attributes.indexPath.section];
        }
    }
    
    //遍历当前屏幕上显示的所有 header，然后将还显示在屏幕上的 header 对应的索引从 headerNeedingLayout 中移除，这样就只保持了对刚刚移出屏幕 header 的追踪
    for (UICollectionViewLayoutAttributes *attributes in layoutAttributes) {
        NSString *elementKind = attributes.representedElementKind;
        if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            [headerNeedingLayout removeIndex:attributes.indexPath.section];
        }
    }
    
    //将刚移出屏幕的 header（Missing Headers）加入 layoutAttributes
    [headerNeedingLayout enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:idx];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
    }];
    
    for (UICollectionViewLayoutAttributes *attributes in layoutAttributes) {
        //找出 header 的 attributes 如果是 Cell 的话 representedElementKind 就为 nil
        NSString *elementKind = attributes.representedElementKind;
        if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            //找出 header 当前所在的 section
            NSInteger section = attributes.indexPath.section;
            //分别返回当前 section 中第一个 item 和 最后一个 item 所对应的 attributes
            UICollectionViewLayoutAttributes *attributesForFirstItemInSection = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
            UICollectionViewLayoutAttributes *attributesForLasrtItemInSection = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:[self.collectionView numberOfItemsInSection:section] - 1 inSection:section]];
            //得到 header 的 frame
            CGRect frame = attributes.frame;
            //找出当前的滑动距离
            CGFloat offsetY = self.collectionView.contentOffset.y;
            
            //接下来我们来践行一开始提到的三个规则
            CGFloat minY = CGRectGetMinY(attributesForFirstItemInSection.frame) - frame.size.height;
            CGFloat maxY = CGRectGetMaxY(attributesForLasrtItemInSection.frame) - frame.size.height;
            //minY ≤ offset ≤ maxY
            CGFloat y = MIN(MAX(offsetY, minY), maxY);
            frame.origin.y = y;
            attributes.frame = frame;
//            attributes.zIndex = 99;
        }
    }
    
    return layoutAttributes;
}

@end
