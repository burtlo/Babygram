//
//  MEXEventsViewController.m
//  Babygram
//
//  Created by Franklin Webber on 10/14/13.
//  Copyright (c) 2013 Guacafy. All rights reserved.
//

#import "MEXEventsViewController.h"
#import "MEXViewController.h"
#import "MEXEvents.h"

@interface MEXEventsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MEXEventsViewController

#pragma mark - UIViewController Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[[self tableView] setDataSource:self];
    [[self tableView] setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Events

- (IBAction)addEvent:(id)sender {
    MEXViewController *eventViewController = [[MEXViewController alloc] init];
    
    [[self navigationController] pushViewController:eventViewController animated:YES];
}

#pragma mark - UITableViewDataSource Adherence

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *events = [MEXEvents all];
    NSInteger count = [events count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];

    NSInteger eventIndex = [indexPath row];
    
    NSArray *events = [MEXEvents all];
    MEXEvent *event = [events objectAtIndex:eventIndex];
    
    [[cell imageView] setImage:[event babyImage]];
    [[cell textLabel] setText:[event babyDescription]];
    return cell;
}

#pragma mark - UITableViewDelegate Adherence

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Find the event
    NSInteger eventIndex = [indexPath row];
    
    NSArray *events = [MEXEvents all];
    MEXEvent *event = [events objectAtIndex:eventIndex];
    
    // Updat    e the MexViewController to allow it have an event
    // Push to the MexViewController with the Event
    
    //create the view controller

    [self performSegueWithIdentifier:@"showEvent" sender:event];
    // TODO: Talk about the situation where this would not push to a black screen
    //    [[self navigationController] pushViewController:controller animated:YES];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"About to Segue");
    
    if ([sender isKindOfClass:[MEXEvent class]]) {
        [[segue destinationViewController] setEvent:sender];
    }
    
}

@end
