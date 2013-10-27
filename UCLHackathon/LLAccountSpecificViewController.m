//
//  LLAccountSpecificViewController.m
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import "LLAccountSpecificViewController.h"
#define booleanOutput @"Yes":@"No"

@interface LLAccountSpecificViewController ()

@end

@implementation LLAccountSpecificViewController
@synthesize account;
@synthesize avatar;
@synthesize name;
@synthesize age;
@synthesize gender;
@synthesize university;
@synthesize course;
@synthesize ethnicity;
@synthesize nationality;
@synthesize religion;
@synthesize smoking;
@synthesize likes;
@synthesize dislikes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	[avatar setImage:account.avatar];
	name.text = @"Tester";
	age.text = account.age.stringValue;
	gender.text = account.gender;
	university.text = account.university;
	course.text = account.course;
	ethnicity.text = account.ethnicity;
	nationality.text = account.nationality;
	religion.text = account.religion;
	smoking.text = account.smoking?booleanOutput;
	likes.text = account.interests.description;
	dislikes.text = account.hates.description;
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rtn_to_last_page:(id)sender {
	[self dismissViewControllerAnimated:YES completion:NULL];
}
@end
