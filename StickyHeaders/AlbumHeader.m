//
//  AlbumHeader.m
//  StickyHeaders
//
//  Created by 224 on 16/1/2.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "AlbumHeader.h"

@interface AlbumHeader ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation AlbumHeader

- (void)setAlbum:(Album *)album {
    self.titleLabel.text = album.title;
}

@end
