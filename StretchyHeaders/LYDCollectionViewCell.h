//
//  LYDCollectionViewCell.h
//  StretchyHeaders
//
//  Created by 224 on 16/1/1.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Session.h"

@interface LYDCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeAndRoomLabel;

@property (strong, nonatomic) Session *session;

@end
