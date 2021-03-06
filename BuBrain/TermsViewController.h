//
//  TermsViewController.h
//  BU Brain
//
//  Created by Cezar Cocu on 10/20/13.
//  Copyright (c) 2013 Cezar Cocu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuBrainCredentials.h"
#import "BUBrainClient.h"
#import "CaptureCredentialsController.h"
#import "ScheduleTableViewController.h"
#import "GradesViewController.h"
#import <ObjectiveGumbo.h>


@interface TermsViewController : UITableViewController <CaptureCredentialsDelegate, UIAlertViewDelegate>


typedef NS_ENUM(NSInteger, BUAvailableTerms) {
    BUAvailableTermsSchedule,
    BUAvailableTermsGrade
};

@property (strong, nonatomic) NSArray *availableTerms;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) NSURLSessionDataTask *currentTask;
@property (strong, nonatomic) UIAlertView *alertView;
@property (nonatomic, readonly) BUAvailableTerms typeofTerm;

- (id)initWithTypeofTerm: (BUAvailableTerms) typeTerm;

@end
