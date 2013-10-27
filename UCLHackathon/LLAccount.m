//
//  LLAccount.m
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import "LLAccount.h"

@implementation LLAccount
@synthesize username;
@synthesize password;
@synthesize email;
@synthesize phonenumber;
@synthesize age;
@synthesize gender;
@synthesize university;
@synthesize course;
@synthesize ethnicity;
@synthesize nationality;
@synthesize interests = _interests;
@synthesize hates = _hates;
@synthesize smoking;
@synthesize religion;
@synthesize paypal;
@synthesize avatar;


-(void)setInterests:(NSString*)interests{
	_interests = [interests componentsSeparatedByString:@","];
}

-(NSArray*)interests{
	return _interests;
}

-(void)setHates:(NSString *)hates{
	_hates = [hates componentsSeparatedByString:@","];
}

-(NSArray*)hates{
	return _hates;
}

@end
