//
//  Home.h
//  Mi primera tabla
//
//  Created by MacL on 20/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home: UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableMain;

-(void) addCellWithName:(NSString*)name withAge:(NSString*)age withDescription:(NSString*)description andImage:(UIImage*) image;

@end

