//
//  LLRoom.h
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLRoom : NSObject
@property (strong,nonatomic) NSString* RID;
@property (strong,nonatomic) NSString* postal;
@property (strong,nonatomic) NSString* address;
@property (strong,nonatomic) NSNumber* tenants;
@property (strong,nonatomic) NSNumber* smoking;
@property (strong,nonatomic) NSNumber* pet;
@property (strong,nonatomic) NSNumber* minimal;
@property (strong,nonatomic) NSNumber* billsIncluded;
@property (strong,nonatomic) NSNumber* price;
@property (strong,nonatomic) NSNumber* deposit;
@property (strong,nonatomic) NSNumber* rented;
@property (strong,nonatomic) NSArray* images;
@end
