//
//  Album.m
//  StickyHeaders
//
//  Created by 224 on 16/1/2.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "Album.h"
#import <UIKit/UIKit.h>
#import "UIImage+decompressedImage.h"

@implementation Album

- (instancetype)initWithTitle:(NSString *)title andPhotos:(NSArray *)photos {
    if (self = [super init]) {
        _title = title;
        _photos = photos;
    }
    return self;
}

+ (NSArray *)allAlbums {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.doesRelativeDateFormatting = YES;
    formatter.dateStyle = NSDateIntervalFormatterFullStyle;
    formatter.locale = [NSLocale currentLocale];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *today = [NSDate new];
    NSDate *yesterDay = [calendar dateByAddingUnit:NSCalendarUnitDay value:-1 toDate:today options:NSCalendarMatchFirst];
    NSDate *theDayBeforeYesterday = [calendar dateByAddingUnit:NSCalendarUnitDay value:-2 toDate:today options:NSCalendarMatchFirst];
    NSDate *theDayBeforeThat = [calendar dateByAddingUnit:NSCalendarUnitDay value:-3 toDate:today options:NSCalendarMatchFirst];
    
    NSArray *titles = @[[formatter stringFromDate:today], [formatter stringFromDate:yesterDay], [formatter stringFromDate:theDayBeforeYesterday], [formatter stringFromDate:theDayBeforeThat]];
    NSMutableArray *tutorialBackgroundImages = [NSMutableArray array];
    for (int i = 1; i <= 24; i++) {
        NSString *imageName = [NSString stringWithFormat:@"Tutorial-%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [tutorialBackgroundImages addObject:[image decompressedImage]];
    }
    
    NSMutableArray *albums = [NSMutableArray array];
    int offset = 0;
    for (NSString *title in titles) {
        NSMutableArray *photos = [NSMutableArray array];
        [tutorialBackgroundImages enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx >= offset && idx < offset + 6) {
                [photos addObject:obj];
            }
        }];
        Album *album = [[Album alloc] initWithTitle:title andPhotos:photos];
        [albums addObject:album];
        offset += 6;
    }
    return albums;
}

@end
