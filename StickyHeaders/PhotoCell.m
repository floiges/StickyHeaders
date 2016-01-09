//
//  PhotoCell.m
//  StickyHeaders
//
//  Created by 224 on 16/1/2.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;


@end

@implementation PhotoCell

- (void)setPhoto:(UIImage *)photo {
    self.photoImageView.image = photo;
}

@end
