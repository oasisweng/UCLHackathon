//
//  LLSignUpViewController.m
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import "LLSignUpViewController.h"
#import "LLSpecificationViewController.h"
#import "LLMainViewController.h"

@interface LLSignUpViewController ()

@end

@implementation LLSignUpViewController
@synthesize sign_up_btn,cancel_btn;
@synthesize username,comfirmPassword,password,email;
@synthesize equalError,lengthError;

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
	[equalError setHidden:YES];
	[lengthError setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)signup:(id)sender {
//	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//	NSDictionary *parameters = @{@"username": username.text,@"password": password.text, @"email":email.text};
//	[manager POST:@"http://example.com/resources.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//		NSLog(@"JSON: %@", responseObject);
//	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//		NSLog(@"Error: %@", error);
//	}];
//	
	
	NSString* fileName = [[NSBundle mainBundle]pathForResource:@"Personal" ofType:@"plist"];
	NSMutableDictionary* personalAttr = [NSMutableDictionary dictionaryWithContentsOfFile:fileName];
	NSDictionary* parameters = @{@"username": username.text,@"password": password.text, @"email":email.text};
	for (NSString* key in [parameters allKeys]){
		NSString* object = [parameters objectForKey:key];
		[personalAttr setValue:object forKey:key];
	}
	[personalAttr writeToFile:fileName atomically:YES];
	
	//Ask if user wants to specify his criteria
	UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Want to specify your info?" message:@"" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"OK",nil];
	[alert show];

	
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
	if (buttonIndex != [alertView cancelButtonIndex]){
		LLSpecificationViewController* svc = [self.storyboard instantiateViewControllerWithIdentifier:@"LLSpecificationViewController"];
		[self presentViewController:svc animated:YES completion:NULL];
	} else {
		LLMainViewController* mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LLMainViewController"];
		[self presentViewController:mvc animated:YES completion:NULL];
		
	}
	[self dismissViewControllerAnimated:YES completion:NULL];	
}

- (IBAction)dismissKeyboard:(id)sender {
	[sender resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
	NSInteger tag = textField.tag;
	if (tag != 0)
		[self checkPassword];
}

-(void)checkPassword{
	if (![comfirmPassword.text isEqualToString:password.text]){
		[sign_up_btn setEnabled:NO];
		[equalError setHidden:NO];
	} else {
		[sign_up_btn setEnabled:YES];
		[equalError setHidden:YES];
	}
	if ([password.text length]<8){
		[lengthError setHidden:NO];
		[sign_up_btn setEnabled:NO];
	} else {
		[lengthError setHidden:YES];
		[sign_up_btn setEnabled:YES];
	}
}


@end
