//
//  AddCellViewController.h
//  Mi primera tabla
//
//  Created by MacL on 26/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "Home.h"


@interface AddCellViewController : UIViewController

@property (nonatomic) Home *home;

- (IBAction)showImagePickerForPhotoPicker:(id)sender;
- (IBAction)showImagePickerForCamera:(id)sender;

@end
