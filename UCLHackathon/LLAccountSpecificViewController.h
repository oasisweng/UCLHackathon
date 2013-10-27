//
//  LLAccountSpecificViewController.h
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLAccount.h"

@interface LLAccountSpecificViewController : UIViewController
@property (strong, nonatomic) LLAccount* account;
@property (strong, nonatomic) IBOutlet UIImageView *avatar;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *age;
@property (strong, nonatomic) IBOutlet UILabel *gender;
@property (strong, nonatomic) IBOutlet UILabel *university;
@property (strong, nonatomic) IBOutlet UILabel *course;
@property (strong, nonatomic) IBOutlet UILabel *ethnicity;
@property (strong, nonatomic) IBOutlet UILabel *nationality;
@property (strong, nonatomic) IBOutlet UILabel *religion;
@property (strong, nonatomic) IBOutlet UILabel *smoking;
@property (strong, nonatomic) IBOutlet UITextView *likes;
@property (strong, nonatomic) IBOutlet UITextView *dislikes;
- (IBAction)rtn_to_last_page:(id)sender;

@end
