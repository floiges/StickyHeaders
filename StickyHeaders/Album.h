//
//  Album.h
//  StickyHeaders
//
//  Created by 224 on 16/1/2.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *photos;

- (instancetype)initWithTitle:(NSString *)title andPhotos:(NSArray *)photos;

+ (NSArray *)allAlbums;

@end
