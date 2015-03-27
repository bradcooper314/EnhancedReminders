//
//  THDReminderTableViewCell.m
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-27.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import "THDReminderTableViewCell.h"

@implementation THDReminderTableViewCell

-(id)initWithReminder:(THDReminder*)reminder cellID:(NSString*)myCellID
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:myCellID];
    if (self) {
        _reminder = reminder;
        
        [[self textLabel] setText:[_reminder title]];
        [[self detailTextLabel] setText:[_reminder description]];
        [self setAccessoryType:UITableViewCellAccessoryDetailButton];
        #warning Hook up images
        //[[self imageView] setImage:[UIImage imageNamed:@"puppy.jpg"]];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
