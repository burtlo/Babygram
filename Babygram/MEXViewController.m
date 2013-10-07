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

@end

@implementation MEXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[self babyText] setDelegate:self];
    [[self doneButton] setEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"Picked an Image");
    
    // TODO: make this based on the image selected

//    UIImage *newBabyImage = [self magicianImage];
//    [[self babyImage] setImage:newBabyImage];
    
    UIImage *newBabyImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [[self babyImage] setImage:newBabyImage];
    
    [picker dismissViewControllerAnimated:YES completion:^{}];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"Cancelled");
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

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
