//
//  THDReminder.m
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-24.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import "THDReminder.h"

@implementation THDReminder

-(id)init
{
    self = [super init];
    if(self) {
        _title = @"New Reminder";
        _description = @"";
        _before = nil;
        _after = nil;
    }
    return self;
}

-(id) initWithTitle:(NSString *)title description:(NSString *)description before:(NSDate *)before after:(NSDate *)after;
{
    self = [super init];
    if(self) {
        _title = title;
        _description = description;
        _before = before;
        _after = after;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _title = [coder decodeObjectForKey:@"title"];
        _description = [coder decodeObjectForKey:@"description"];
        _before = [coder decodeObjectForKey:@"before"];
        _after = [coder decodeObjectForKey:@"after"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_title forKey:@"title"];
    [coder encodeObject:_description forKey:@"description"];
    [coder encodeObject:_before forKey:@"before"];
    [coder encodeObject:_after forKey:@"after"];
}

@end
