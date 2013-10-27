//
//  LLSignUpViewController.h
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface LLSignUpViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *sign_up_btn;
@property (strong, nonatomic) IBOutlet UIButton *cancel_btn;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *comfirmPassword;
@property (strong, nonatomic) IBOutlet UILabel *lengthError;
@property (strong, nonatomic) IBOutlet UILabel *equalError;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)cancel:(id)sender;
- (IBAction)signup:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
