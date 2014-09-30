//
//  ViewController.m
//  iTrapp
//
//  Created by Sergi Asensio on 29/09/14.
//  Copyright (c) 2014 Sergi Asensio. All rights reserved.
//

#import "ViewController.h"
#import "Concierto.h"

@interface ViewController ()
@property NSMutableArray *conciertos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _conciertos = [[NSMutableArray alloc] init];
    Concierto *concierto = [[Concierto alloc] init];
    concierto.nombre = @"PXXR PVRTY";
    concierto.discos = [[NSMutableArray alloc] init];
    Disco *disco = [[Disco alloc] init];
    disco.nombre = @"ADROMICFMS";
    disco.precio = @10;
    disco.vendidos= @0;
    [concierto.discos addObject:disco];
    [_conciertos addObject:concierto];
    
    Concierto *concierto1 = [[Concierto alloc] init];
    concierto1.nombre = @"LA MERCE";
    concierto1.discos = [[NSMutableArray alloc] init];
    disco.nombre = @"RU";
    disco.precio = @8;
    disco.vendidos= @1;
    [concierto1.discos addObject:disco];
    [_conciertos addObject:concierto1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:@"Celda"];
    Concierto *concierto = [_conciertos objectAtIndex:indexPath.row];
    UILabel *etiqueta = (UILabel *) [celda viewWithTag:42];
    etiqueta.text = concierto.nombre;
    return celda;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _conciertos.count;
}

@end
