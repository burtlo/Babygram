//
//  MEXEventsViewController.m
//  Babygram
//
//  Created by Franklin Webber on 10/14/13.
//  Copyright (c) 2013 Guacafy. All rights reserved.
//

#import "MEXEventsViewController.h"
#import "MEXViewController.h"

@interface MEXEventsViewController ()

@end

@implementation MEXEventsViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addEvent:(id)sender {
    MEXViewController *eventViewController = [[MEXViewController alloc] init];
    
    [[self navigationController] pushViewController:eventViewController animated:YES];
}
@end
