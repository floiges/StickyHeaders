//
//  Session.h
//  StretchyHeaders
//
//  Created by 224 on 16/1/1.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *speaker;
@property (copy, nonatomic) NSString *room;
@property (copy, nonatomic) NSString *time;

@property (copy, nonatomic) NSString *roomAndTime;

- (instancetype)initWithTitle:(NSString *)title
                      speaker:(NSString *)speaker
                         room:(NSString *)room
                      andTime:(NSString *)time;

- (instancetype)initSessionWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)allSessions;

@end
