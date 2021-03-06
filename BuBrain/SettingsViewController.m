//
//  SettingsViewController.m
//  BU Brain
//
//  Created by Cezar Cocu on 11/9/13.
//  Copyright (c) 2013 Cezar Cocu. All rights reserved.
//

#import "SettingsViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tableView.scrollEnabled = NO;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Settings";
    BuBrainCredentials *cred = [BuBrainCredentials sharedInstance];
    NSArray * credentials = [cred getCredentials];
    if(credentials){
        self.userName = credentials[0];
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if (!self.userName)
        return 1;
    
    else
        return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text  = @"No Credentials Curently Stored";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // Configure the cell...
    if(self.userName)
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"User: %@", self.userName ];
            break;
            
        default:
            cell.textLabel.text = @"Log Out";
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
            cell.textLabel.textColor = UIColorFromRGB(0x006221);
            break;
    }
    cell.textLabel.font = [UIFont systemFontOfSize:21.0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1 && self.userName) {
        BuBrainCredentials *cred = [BuBrainCredentials sharedInstance];
        [cred DeleteCredentialsForUser:self.userName];
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}



@end
