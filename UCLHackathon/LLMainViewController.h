//
//  LLMainViewController.h
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLAccount.h"
#import "LLRoom.h"

@interface LLMainViewController : UITabBarController<UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIView *sideView;
@property (strong, nonatomic) NSArray* accounts;
@property (strong, nonatomic) NSArray* rooms;
@property (strong, nonatomic) LLAccount* personal;
@property (strong, nonatomic) IBOutlet UIImageView *avatar;
@property (strong, nonatomic) IBOutlet UILabel *name;

-(void)getAccounts;
-(void)getRooms;

@end

