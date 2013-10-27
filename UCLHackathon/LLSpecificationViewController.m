//
//  LLSpecificationViewController.m
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import "LLMainViewController.h"
#import "LLSpecificationViewController.h"

@interface LLSpecificationViewController ()
@property (strong,nonatomic) NSDictionary* options;
@property (strong,nonatomic) NSArray* selection;
@end

@implementation LLSpecificationViewController
@synthesize pickerView;
@synthesize selectionView;
@synthesize selection;
@synthesize options;
NSInteger buttonTag;
@synthesize age_btn,uni_btn,course_btn,eth_btn,nat_btn,rel_btn;
@synthesize phone_num,gender,isSmoking;

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
	
	NSString* fileName = [[NSBundle mainBundle]pathForResource:@"specifications" ofType:@"plist"];
	options = [NSDictionary dictionaryWithContentsOfFile:fileName];
	[[NSBundle mainBundle] loadNibNamed:@"pickerView" owner:self options:nil];
	CGRect frame = selectionView.frame;
	frame.origin.x = 0;
	frame.origin.y = self.view.frame.size.height - frame.size.height;
	selectionView.frame = frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
	[self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)confirm:(id)sender {
//	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//	[manager PUT:@"http://example.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//		NSLog(@"JSON: %@", responseObject);
//	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//		NSLog(@"Error: %@", error);
//	}];
	
	NSString* fileName = [[NSBundle mainBundle]pathForResource:@"Personal" ofType:@"plist"];
	NSMutableDictionary* personalAttr = [NSMutableDictionary dictionaryWithContentsOfFile:fileName];
	NSDictionary* parameters = @{@"phonenumber":phone_num.text,@"age":[NSNumber numberWithInt:age_btn.titleLabel.text.integerValue],@"gender":(gender.selectedSegmentIndex == 1?@"Male":@"Female"),@"university":uni_btn.titleLabel.text,@"course":course_btn.titleLabel.text,@"ethnicity":eth_btn.titleLabel.text, @"nationality":nat_btn.titleLabel.text,@"smoking":[NSNumber numberWithBool:isSmoking.isOn],@"religion":rel_btn.titleLabel.text};
	
	for (NSString* key in [parameters allKeys]){
		NSString* object = [parameters objectForKey:key];
		[personalAttr setValue:object forKey:key];
	}

	[personalAttr writeToFile:fileName atomically:YES];
	
	LLMainViewController* mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LLMainViewController"];
	[self presentViewController:mvc animated:YES completion:NULL];
}

- (IBAction)dismissKeyboard:(id)sender {
	[self resignFirstResponder];
}

- (IBAction)dropDownFor:(UIButton *)sender {
	buttonTag = sender.tag;
	[pickerView reloadAllComponents];
	[self.view addSubview:selectionView];

}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	NSString* keyword = @"";
	switch (buttonTag) {
		case 1:{
			keyword = @"university";
			break;}
		case 2:{
			keyword = @"course";
			break;}
		case 3:{
			keyword = @"ethnicity";
			break;}
		case 4:{
			keyword = @"nationality";
			break;}
		case 5:{
			keyword = @"religion";
			break;}
		case 6:{
			keyword = @"age";
			break;}
		default:
			break;
	}
	
	if ([keyword isEqualToString:@"age" ]){
		NSInteger minAge = [[selection objectAtIndex:0] integerValue];
		return [NSString stringWithFormat:@"%i",minAge+row];
	}
	
	return (NSString*)[selection objectAtIndex:row];
}

// 1 for uni, 2 for course, 3 for eth, 4 for nationality, 5 for religion, 6 for age
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	NSString* keyword = @"";
	switch (buttonTag) {
		case 1:{
			keyword = @"university";
			break;}
		case 2:{
			keyword = @"course";
			break;}
		case 3:{
			keyword = @"ethnicity";
			break;}
		case 4:{
			keyword = @"nationality";
			break;}
		case 5:{
			keyword = @"religion";
			break;}
		case 6:{
			keyword = @"age";
			break;}
		default:
			break;
	}
	
	selection = [options objectForKey:keyword];
	
	if ([keyword isEqualToString:@"age" ]){
		NSInteger minAge = [[selection objectAtIndex:0] integerValue];
		NSInteger maxAge = [[selection objectAtIndex:1] integerValue];
		return maxAge-minAge+1;
	}
	
	return selection.count;
	
	
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 1;
}

- (IBAction)confirmSelection:(id)sender {
	[selectionView removeFromSuperview];
	NSInteger rowSelected = [pickerView selectedRowInComponent:0];
	NSString* update_string = [[NSString alloc]init];
	if (buttonTag == 6)
		update_string = [NSString stringWithFormat:@"%i",rowSelected+[[selection objectAtIndex:0] integerValue]];
	else
		update_string = (NSString*)[selection objectAtIndex:rowSelected];
	UIButton* update_section = [[UIButton alloc]init];
	switch (buttonTag) {
		case 1:{
			update_section = uni_btn;
			break;}
		case 2:{
			update_section = course_btn;
			break;}
		case 3:{
			update_section = eth_btn;
			break;}
		case 4:{
			update_section = nat_btn;
			break;}
		case 5:{
			update_section = rel_btn;
			break;}
		case 6:{
			update_section = age_btn;
			break;}
		default:
			break;
	}
	
	[update_section setTitle:update_string forState:UIControlStateNormal];
	NSLog(@"Confirmed %@",update_section);

	
}
@end
