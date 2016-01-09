//
//  Session.m
//  StretchyHeaders
//
//  Created by 224 on 16/1/1.
//  Copyright © 2016年 zoomlgd. All rights reserved.
//

#import "Session.h"

@implementation Session

- (instancetype)initWithTitle:(NSString *)title speaker:(NSString *)speaker room:(NSString *)room andTime:(NSString *)time {
    if (self = [super init]) {
        _title = title;
        _speaker = speaker;
        _room = room;
        _time = time;
    }
    return self;
}

- (instancetype)initSessionWithDictionary:(NSDictionary *)dictionary {
    NSString *title = dictionary[@"Title"];
    NSString *speaker = dictionary[@"Speaker"];
    NSString *room = dictionary[@"Room"];
    NSString *time = dictionary[@"Time"];
    return [self initWithTitle:title speaker:speaker room:room andTime:time];
}

- (NSString *)roomAndTime {
    NSString *returnString = [NSString stringWithFormat:@"%@ . %@",_time,_room];
    return returnString;
}

+ (NSArray *)allSessions {
    NSMutableArray *sessions = [NSMutableArray array];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Sessions" withExtension:@"plist"];
    NSArray *sessionsPlist = [NSArray arrayWithContentsOfURL:url];
    for (NSDictionary *dictionary in sessionsPlist) {
        Session *session = [[Session alloc] initSessionWithDictionary:dictionary];
        [sessions addObject:session];
    }
    return sessions;
}

@end
