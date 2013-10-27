//
//  LLMainViewController.m
//  UCLHackathon
//
//  Created by Dingzhong Weng on 10/27/13.
//  Copyright (c) 2013 Dingzhong Weng. All rights reserved.
//

#import "LLMainViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LLMainViewController ()

@end

@implementation LLMainViewController
@synthesize sideView;

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
	
	self.view.layer.shadowRadius = 3;
	self.view.layer.shadowColor = [[UIColor darkGrayColor]CGColor];
	self.view.layer.shadowOffset = CGSizeMake(1, 1);
	
	UIPanGestureRecognizer* pgr = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(sideView_in:)];
	pgr.delegate = self;
	[self.view addGestureRecognizer:pgr];
	
	[[NSBundle mainBundle]loadNibNamed:@"sideView" owner:self options:nil];
	CGRect frame = sideView.frame;
	frame.origin.x = -sideView.frame.size.width;
	frame.origin.y = 0;
	sideView.frame = frame;
	
	[self.view addSubview:sideView];
	// Do any additional setup after loading the view.
}

-(void)sideView_in:(UIPanGestureRecognizer*)pgr{
	CGPoint translation = [pgr translationInView:self.view];
	if (sideView.frame.origin.x < 0){
		CGRect frame = sideView.frame;
		frame.origin.x += translation.x;
		sideView.frame = frame;
	} else if (sideView.frame.origin.x >=0){
		CGRect frame = sideView.frame;
		frame.origin.x = 0;
		sideView.frame = frame;
	}
	
	if (translation.x<-5){
		[UIView beginAnimations:@"fade back" context:nil];
		[UIView setAnimationBeginsFromCurrentState:YES];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		[UIView setAnimationDuration:1];
		CGRect frame = sideView.frame;
		frame.origin.x = -frame.size.width;
		sideView.frame = frame;
	}
	
	[pgr setTranslation:CGPointMake(0, 0) inView:self.view];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
