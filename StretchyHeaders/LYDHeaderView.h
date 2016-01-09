//
//  LYDHeaderView.h
//  StretchyHeaders
//
//  Created by 224 on 16/1/1.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYDHeaderView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewHeightLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backGroundImageViewHeightLayoutConstraint;
@end
