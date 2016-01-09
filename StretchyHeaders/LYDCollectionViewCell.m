//
//  LYDCollectionViewCell.m
//  StretchyHeaders
//
//  Created by 224 on 16/1/1.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "LYDCollectionViewCell.h"

@implementation LYDCollectionViewCell

- (void)setSession:(Session *)session {
    self.titleLabel.text = session.title;
    self.timeAndRoomLabel.text = session.roomAndTime;
}

@end
