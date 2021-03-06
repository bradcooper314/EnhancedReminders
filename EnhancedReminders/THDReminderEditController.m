//
//  THDReminderEditController.m
//  EnhancedReminders
//
//  Created by Adam LeBlanc on 2015-03-25.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import "THDReminderEditController.h"

@interface THDReminderEditController ()
-(void)updateBeforeText:(id)sender;
-(void)dismissKeyboard;
-(void)updateAfterText:(id)sender;
@end

@implementation THDReminderEditController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //clicking screen dismisses keyboard
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(dismissKeyboard)];
        
        [self.view addGestureRecognizer:tap];
    }
    return self;
    
}

-(id)initWithReminder:(THDReminder *)reminder
{
    self = [self init];
    if (self) {
        _reminder = reminder;
        
        [_titleText setText:[_reminder title]];
        [_descriptionText setText:[_reminder description]];
        [_triggerAfterText setText:[NSString stringWithFormat:@"%@", [_reminder after]]];
        [_triggerBeforeText setText:[NSString stringWithFormat:@"%@", [_reminder before]]];
    }
    return self;
}

-(void)dismissKeyboard
{
    [_triggerBeforeText resignFirstResponder];
    [_triggerAfterText resignFirstResponder];
    [_descriptionText resignFirstResponder];
    [_titleText resignFirstResponder];
}

//Chagne date field when date picker is spun
-(void)updateBeforeText:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.triggerBeforeText.inputView;
    self.triggerBeforeText.text = [NSString stringWithFormat:@"%@",picker.date];
}

-(void)updateAfterText:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.triggerAfterText.inputView;
    self.triggerAfterText.text = [NSString stringWithFormat:@"%@",picker.date];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:(_reminder == nil ? @"New Reminder" : [_reminder title])];
}

//- (IBAction)triggerAfter:(id)sender {
//    NSLog(@"Here");
//    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
//    datePicker.datePickerMode = UIDatePickerModeDate;
//    //[datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
//    //datePicker.tag = indexPath.row;
//    _triggerBeforeText.inputView = datePicker;
//}

//- (IBAction)triggerBy:(id)sender {
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//Display datepicker instead of keyboard
- (IBAction)byTimeDidBeginEdit:(id)sender {
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateBeforeText:) forControlEvents:UIControlEventValueChanged];
    [self.triggerBeforeText setInputView:datePicker];
}

- (IBAction)afterTimeDidBeginEdit:(id)sender {
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateAfterText:) forControlEvents:UIControlEventValueChanged];
    [self.triggerAfterText setInputView:datePicker];
}
@end
