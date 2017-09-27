//
//  Home.m
//  Mi primera tabla
//
//  Created by MacL on 20/09/17.
//  Copyright © 2017 MacL. All rights reserved.
//

#import "Home.h"
#import "cellMainTable.h"
#import "AddCellViewController.h"
#import "InfoViewController.h"

@interface Home ()
@property NSMutableArray *userNames;
@property NSMutableArray *userAges;
@property NSMutableArray *userImgs;
@property NSMutableArray *userImgsType;
@property NSMutableArray *userDescriptions;

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
    self.userNames = [[NSMutableArray alloc] initWithObjects: @"Tyrion Lanniser", @"Daenerys Targaryen", @"Jon Snow", @"Aria Stark", @"Cersei Lannister", @"Gregor Clegane", @"Sansa Stark", nil ];
    self.userImgs =[[NSMutableArray alloc] initWithObjects: @"tyrion.jpeg", @"Daenerys.jpeg", @"JonSnow.jpeg", @"AryaStark.jpeg", @"CerseiLannister.jpeg",@"GregorClegane.jpeg", @"SansaStark.jpeg", nil ];
    self.userAges =[[NSMutableArray alloc] initWithObjects: @"38 años", @"30 años", @"32 años", @"16 años", @"42 años", @"16 años", @"16 años", nil ];
    self.userImgsType =[[NSMutableArray alloc] initWithObjects: [NSNumber numberWithBool:false], [NSNumber numberWithBool:false], [NSNumber numberWithBool:false], [NSNumber numberWithBool:false], [NSNumber numberWithBool:false], [NSNumber numberWithBool:false], [NSNumber numberWithBool:false], nil ];
    
    self.userDescriptions = [[NSMutableArray alloc] initWithObjects:
                             @"Tyrion Lannister es el tercer hijo de Lord Tywin Lannister y Lady Joanna Lannister, y hermano menor de los gemelos Cersei y Jaime. Es apodado el Gnomo y Mediohombre debido a su enanismo.",
                             @"La reina Daenerys Targaryen, también llamada Daenerys de la Tormenta, La que no Arde, Rompedora de Cadenas, Madre de Dragones y, de manera más informal, Dany, es la hija menor del rey Aerys II Targaryen y su hermana esposa, la reina Rhaella. Luego de la Guerra del Usurpador, durante la que murieron sus padres y su hermano mayor Rhaegar, ella y su hermano Viserys vivieron en el exilio en varias Ciudades Libres. ",
                             @"Lord Jon Nieve es el Lord Comandante de la Guardia de la Noche nº 998. Es hijo bastardo de Lord Eddard Stark. Su lobo huargo, Fantasma, es albino y mudo. El emblema personal de Jon consiste en los colores de la Casa Stark invertidos, un lobo huargo de plata corriendo sobre fondo de cenizo.",
                             @"Arya Stark es la segunda hija de Lord Eddard Stark y Lady Catelyn Tully. Tiene una hermana, Sansa; tres hermanos, Robb, Brandon y Rickon, y un medio-hermano bastardo, Jon Nieve, al que aprecia mucho. Como algunos de sus hermanos, ella es una cambiapieles, pudiendo entrar en la piel de su loba huargo, Nymeria.",
                             @"La reina Cersei Lannister es la hija mayor de Lord Tywin Lannister y Lady Joanna Lannister. Tiene dos hermanos, su mellizo Jaime y su hermano menor Tyrion. Tras la Guerra del Usurpador se casó con el nuevo rey, Robert Baratheon, y se convirtió en Reina de los Siete Reinos. Es madre de tres hijos, Joffrey, Myrcella y Tommen, todos fruto de su secreta relación incestuosa con su hermano Jaime.",
                             @"Ser Gregor Clegane, apodado La Montaña que Cabalga o simplemente La Montaña, fue cabeza de la Casa Clegane y vasallo de la Casa Lannister. Es conocido por su estatura, crueldad y poderío en batalla.",
                             @"Sansa Stark es la hija mayor de Lord Eddard Stark y Lady Catelyn Tully. Tiene tres hermanos, Robb, Brandon y Rickon; una hermana, Arya, y un medio hermano bastardo, Jon Nieve. Está casada con Tyrion Lannister.", nil];
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
    BOOL isImage = [self.userImgsType[indexPath.row] boolValue];
    if(isImage){
        cell.ImgUser.image      = self.userImgs[indexPath.row];
    } else {
        cell.ImgUser.image      = [UIImage imageNamed:self.userImgs[indexPath.row]];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"HomeToInfo" sender:self];
}


/////END TABLE


- (IBAction)btnAddPressed:(id)sender {
    //[self.userNames]
}

-(void) addCellWithName:(NSString*)name withAge:(NSString*)age withDescription:(NSString *)description andImage:(UIImage *)image {
    [self.userNames addObject:name];
    [self.userAges addObject:age];
    [self.userImgs addObject:image];
    [self.userImgsType addObject:[NSNumber numberWithBool:true]];
    [self.userDescriptions addObject:description];
    [self.tableMain reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier  isEqualToString:@"HomeToAdd"])
    {
        AddCellViewController *addCell = [segue destinationViewController];
    
        addCell.home = self;
    }
    else {
        InfoViewController *infoView = [segue destinationViewController];
        
        long index = [self.tableMain.indexPathForSelectedRow row];
        UIImage* image = nil;
        BOOL isImage = [self.userImgsType[index] boolValue];
        if(isImage){
            image = self.userImgs[index];
        } else {
            image = [UIImage imageNamed:self.userImgs[index]];
        }
        
        [infoView setInfoWithName:self.userNames[index] withAge:self.userAges[index] withDescription:self.userDescriptions[index] andImage:image];
    }
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
}

@end
