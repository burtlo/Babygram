//
//  MEXViewController.h
//  Babygram
//
//  Created by Franklin Webber on 10/7/13.
//  Copyright (c) 2013 Guacafy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEXEvents.h"

@interface MEXViewController : UIViewController <UIImagePickerControllerDelegate, UITextViewDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) MEXEvent *event;

@end
