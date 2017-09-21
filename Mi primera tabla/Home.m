//
//  Home.m
//  Mi primera tabla
//
//  Created by MacL on 20/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import "Home.h"
#import "cellMainTable.h"

@interface Home ()
@property NSMutableArray *userNames;
@property NSMutableArray *userAges;
@property NSMutableArray *userImgs;

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initController{
    self.userNames = [[NSMutableArray alloc] initWithObjects: @"Tyrion Lanniser", @"Daenerys Targaryen", @"Jon Snow", @"Aria Stark", @"Cersei Lannister", nil ];
    self.userImgs =[[NSMutableArray alloc] initWithObjects: @"tyrion.jpej", @"Daenerys.jpeg", @"JonSnow.jpeg", @"AriaStark.jpej", @"CerseiLannister.jpeg", nil ];
    self.userAges =[[NSMutableArray alloc] initWithObjects: @"38 años", @"30 años", @"32 años", @"16 años", @"42 años", nil ];
}

//////TABLE

- (NSInteger)numberOfSectionTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.userNames.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellMainTable *cell = (cellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMainTable" bundle:nil] forCellReuseIdentifier:@"cellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    }
    //Fill cell with info from arrays
    cell.labelName.text       = self.userNames[indexPath.row];
    cell.labelAge.text        = self.userAges[indexPath.row];
    cell.ImgUser.image      = [UIImage imageNamed:self.userImgs[indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Pending
}


/////END TABLE

@end
