//
//  LLRoomSpecificViewController.h
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLRoom.h"

@interface LLRoomSpecificViewController : UIViewController
@property (strong, nonatomic) LLRoom* room;
@property (strong, nonatomic) IBOutlet UIImageView *avatar;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *postal;
@property (strong, nonatomic) IBOutlet UILabel *tenants_num;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *deposit;
@property (strong, nonatomic) IBOutlet UITextView *specs;
@property (strong, nonatomic) IBOutlet UIButton *s_up_c_pro;
- (IBAction)rtn_to_last_screen:(id)sender;
- (IBAction)sign_up:(id)sender;
- (IBAction)contact_provider:(id)sender;
- (IBAction)add_to_wish_list:(id)sender;

@end
