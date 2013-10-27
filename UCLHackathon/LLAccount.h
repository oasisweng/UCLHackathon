//
//  LLAccount.h
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLAccount : NSObject
@property (strong,nonatomic) NSString* username;
@property (strong,nonatomic) NSString* password;
@property (strong,nonatomic) NSString* email;
@property (strong,nonatomic) NSString* phonenumber;
@property (strong,nonatomic) NSNumber* age;
@property (strong,nonatomic) NSString* gender;
@property (strong,nonatomic) NSString* university;
@property (strong,nonatomic) NSString* course;
@property (strong,nonatomic) NSString* ethnicity;
@property (strong,nonatomic) NSString* nationality;
@property (strong,nonatomic) NSArray* interests;
@property (strong,nonatomic) NSArray* hates;
@property (strong,nonatomic) NSNumber* smoking;
@property (strong,nonatomic) NSString* religion;
@property (strong,nonatomic) NSString* paypal;
@property (strong,nonatomic) NSString* avatar;
@property (strong,nonatomic) NSString* uid;
@end
