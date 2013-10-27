//
//  LLSpecificationViewController.h
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface LLSpecificationViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
- (IBAction)cancel:(id)sender;
- (IBAction)confirm:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)dropDownFor:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)confirmSelection:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *selectionView;
@property (strong, nonatomic) IBOutlet UIButton *age_btn;
@property (strong, nonatomic) IBOutlet UIButton *uni_btn;
@property (strong, nonatomic) IBOutlet UIButton *course_btn;
@property (strong, nonatomic) IBOutlet UIButton *eth_btn;
@property (strong, nonatomic) IBOutlet UIButton *nat_btn;
@property (strong, nonatomic) IBOutlet UIButton *rel_btn;
@property (strong, nonatomic) IBOutlet UITextField *phone_num;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gender;
@property (strong, nonatomic) IBOutlet UISwitch *isSmoking;


@end
