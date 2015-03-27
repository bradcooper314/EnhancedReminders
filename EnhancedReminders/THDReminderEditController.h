//
//  THDReminderEditController.h
//  EnhancedReminders
//
//  Created by Adam LeBlanc on 2015-03-25.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THDReminder.h"

@interface THDReminderEditController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleText;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UITextField *triggerAfterText;
@property (weak, nonatomic) IBOutlet UITextField *triggerBeforeText;
@property THDReminder* reminder;

//-(id)initWithReminder:(THDReminder*)reminder;
- (IBAction)byTimeDidBeginEdit:(id)sender;
- (IBAction)afterTimeDidBeginEdit:(id)sender;

@end
