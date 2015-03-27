//
//  THDReminderDetailsController.m
//  EnhancedReminders
//
//  Created by iOS Developer on 2015-03-12.
//  Copyright (c) 2015 UPEICS. All rights reserved.
//

#import "THDReminderDetailsController.h"
#import "THDReminderEditController.h"

@interface THDReminderDetailsController ()

@end

@implementation THDReminderDetailsController

-(id)initWithReminder:(THDReminder*)reminder
{
    
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _reminder = reminder;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:[_reminder title]];
    
    //Create Edit button on the right of the navigation bar
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonPressed)];
    [[self navigationItem] setRightBarButtonItem:editButton];
    
    NSLog(@"Loaded");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)editButtonPressed
{
//    UIViewController *controller = [[THDReminderEditController alloc] initWithReminder:_reminder];
//    [[self navigationController] pushViewController:controller animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myCellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCellID];
    
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCellID];
    
    switch([indexPath row]) {
        case 0: [[cell textLabel] setText:[_reminder title]];
            break;
        case 1: [[cell textLabel] setText:[_reminder description]];
            break;
        case 2: [[cell textLabel] setText:[NSString stringWithFormat:@"%@", [_reminder after]]];
            break;
        case 3: [[cell textLabel] setText:[NSString stringWithFormat:@"%@", [_reminder before]]];
            break;
    }
    
    return cell;
}

@end
