//
//  MEXViewController.m
//  Babygram
//
//  Created by Franklin Webber on 10/7/13.
//  Copyright (c) 2013 Guacafy. All rights reserved.
//

#import "MEXViewController.h"

@interface MEXViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *babyImage;
@property (weak, nonatomic) IBOutlet UITextView *babyText;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (strong, nonatomic) NSString *babyImageURL;

@end

@implementation MEXViewController

#pragma mark - ViewController Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[self babyText] setDelegate:self];
    [[self doneButton] setEnabled:NO];
    [[self navigationItem] setTitle: @"Babygram"];
    
    // if the event is not NULL
    if ([self event] != NULL) {
        [[self babyText] setText:[[self event] babyDescription]];
        [[self babyImage] setImage:[[self event] babyImage]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Creating an Entry

- (IBAction)saveEntry:(id)sender {
    NSLog(@"saving new entry");
    
    // image url/path
//   TODO: fix the url of the babyImageURL [self babyImageURL]
    [[self babyImage] image];
    // description
    [[self babyText] text];
    // date time now - system time
    [NSDate date];

    NSDictionary *dictionary = @{@"image": [[self babyImage] image], @"description": [[self babyText] text], @"created_at": [NSDate  date]};
    
    // create an instance of a model with this data
    MEXEvent* event = [MEXEvent create:dictionary];
    
    // Create an entry in our entry database with that information
    [MEXEvents save:event];
    
    [[self navigationController] popViewControllerAnimated:YES];
}


#pragma mark - Taking a Picture

- (IBAction)takePicture:(id)sender {
    NSLog(@"Pushing Button");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    
    [self presentViewController:picker animated:YES completion:^{
        NSLog(@"Launching");
    }];
    
}

- (UIImage *)magicianImage {
    return [UIImage imageNamed:@"magician.jpg"];
}

#pragma mark - UIImagePickerControllerDelegate adherence

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"Picked an Image");
    
    [[self babyImage] setImage:[info objectForKey:@"UIImagePickerControllerOriginalImage"]];
    // TODO: SAVE IMAGE LOCALLY and use that URL for the baby image url
    //    [[self babyImage] setImage:[UIImage imageNamed:[self babyImageURL]]];
    //[self setBabyImageURL:[info objectForKey:@"UIImagePickerControllerReferenceURL"]];
    
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"Cancelled");
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - UITextViewDelegate Adherence

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    NSLog(@"shouldBeginEditing");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [[self doneButton] setEnabled:YES];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    NSLog(@"shouldEndEditing");
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"didEndEditing");
    [[self doneButton] setEnabled:NO];
}

- (IBAction)hideKeyboard:(id)sender {
    [[self babyText] resignFirstResponder];
}


@end
