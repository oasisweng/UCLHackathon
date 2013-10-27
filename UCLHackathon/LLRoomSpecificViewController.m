//
//  LLRoomSpecificViewController.m
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import "LLRoomSpecificViewController.h"

#define booleanOutput @"Yes":@"No"

@interface LLRoomSpecificViewController ()

@end

@implementation LLRoomSpecificViewController
@synthesize avatar;
@synthesize address;
@synthesize postal;
@synthesize tenants_num;
@synthesize price;
@synthesize deposit;
@synthesize room;
@synthesize specs;
@synthesize s_up_c_pro;

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
	specs.text = [NSString stringWithFormat:@"specs:\nminimal contract:%i\nbill included:%@\n,pet allowed:%@\nsmoking allowed:%@\n",room.minimal.integerValue,room.billsIncluded.boolValue?booleanOutput,room.pet.boolValue?booleanOutput,room.smoking.boolValue?booleanOutput];
	avatar = [room.images objectAtIndex:0];
	address.text = room.address;
	postal.text = room.postal;
	tenants_num.text = [NSString stringWithFormat:@"%i",room.tenants.integerValue];
	price.text = [NSString stringWithFormat:@"%i",room.price.integerValue];
	deposit.text = [NSString stringWithFormat:@"%i",room.deposit.integerValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rtn_to_last_screen:(id)sender {
	[self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)sign_up:(id)sender {
	if ([s_up_c_pro.titleLabel.text isEqualToString:@"sign-up"])
		[s_up_c_pro setTitle:@"contact provider" forState:UIControlStateNormal|UIControlStateHighlighted];
}

- (IBAction)contact_provider:(id)sender {
	if ([s_up_c_pro.titleLabel.text isEqualToString:@"contact provider"])
		[s_up_c_pro setTitle:@"sign-up" forState:UIControlStateNormal|UIControlStateHighlighted];
}

- (IBAction)add_to_wish_list:(id)sender {
}
@end
