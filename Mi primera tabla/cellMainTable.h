//
//  cellMainTable.h
//  Mi primera tabla
//
//  Created by MacL on 20/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellMainTable : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImgUser;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelAge;

@end
