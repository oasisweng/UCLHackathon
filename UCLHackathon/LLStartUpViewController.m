//
//  LLStartUpViewController.m
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import "LLSignInViewController.h"
#import "LLStartUpViewController.h"

@interface LLStartUpViewController ()

@end

@implementation LLStartUpViewController

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
}

- (void)viewDidAppear:(BOOL)animated{
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(signin) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)signin{
	LLSignInViewController* sivc = [self.storyboard instantiateViewControllerWithIdentifier:@"LLSignInViewController"];
	NSLog(@"%@",sivc);
	[self presentViewController:sivc animated:YES completion:NULL];
}

@end
