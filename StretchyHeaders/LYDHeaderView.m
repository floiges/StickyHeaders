//
//  LYDHeaderView.m
//  StretchyHeaders
//
//  Created by 224 on 16/1/1.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "LYDHeaderView.h"
#import "LYDLayoutAttributes.h"

@interface LYDHeaderView ()

@property (assign, nonatomic) CGFloat backgroundImageViewHeight;
@property (assign, nonatomic) CGFloat logoImageViewHeight;
@property (assign, nonatomic) CGFloat previousHeight;

@end

@implementation LYDHeaderView

- (void)awakeFromNib {
    self.backgroundImageViewHeight = CGRectGetHeight(self.backGroundImageView.bounds);
    self.logoImageViewHeight = CGRectGetHeight(self.logoImageView.bounds);
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    LYDLayoutAttributes *attributes = (LYDLayoutAttributes *)layoutAttributes;
    
    CGFloat height = CGRectGetHeight(attributes.frame);
    
    //和上次记录的 height 作比较，只有不相等才做以下操作
    if (self.previousHeight != height) {
        self.backGroundImageViewHeightLayoutConstraint.constant = self.backgroundImageViewHeight - attributes.deltaY;
        self.logoImageViewHeightLayoutConstraint.constant = self.logoImageViewHeight + attributes.deltaY;
        self.previousHeight = height;
    }
    
}

@end
