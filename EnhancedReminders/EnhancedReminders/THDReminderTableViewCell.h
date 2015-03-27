//
//  THDReminderTableViewCell.h
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-27.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THDReminder.h"

@interface THDReminderTableViewCell : UITableViewCell

@property (readonly) THDReminder* reminder;

-(id)initWithReminder:(THDReminder*)reminder cellID:(NSString*)myCellID;

@end
