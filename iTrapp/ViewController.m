//
//  ViewController.m
//  iTrapp
//
//  Created by Sergi Asensio on 29/09/14.
//  Copyright (c) 2014 Sergi Asensio. All rights reserved.
//

#import "ViewController.h"
#import "Concierto.h"
#import "InformacionConciertoViewController.h"

@interface ViewController ()
@property NSMutableArray *conciertos;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*_conciertos = [[NSMutableArray alloc] init];
    Concierto *concierto = [[Concierto alloc] init];
    concierto.nombre = @"PXXR PVRTY";
    concierto.discos = [[NSMutableArray alloc] init];
    Disco *disco = [[Disco alloc] init];
    NSNumber *myNumber = @10;
    NSInteger myInteger = [myNumber integerValue];
    disco.nombre = @"ADROMICFMS";
    disco.precio = myInteger;
    
    myNumber = @0;
    myInteger = [myNumber integerValue];
    
    disco.vendidos=myInteger ;
    [concierto.discos addObject:disco];
    [_conciertos addObject:concierto];
    
    Disco *d = [[Disco alloc] init];
    Concierto *concierto1 = [[Concierto alloc] init];
    concierto1.nombre = @"LA MERCE";
    concierto1.discos = [[NSMutableArray alloc] init];
    d.nombre = @"RU";
    
    myNumber = @8;
    myInteger = [myNumber integerValue];
    d.precio = myInteger;
    
    myNumber = @1;
    myInteger = [myNumber integerValue];
    d.vendidos= myInteger;
    [concierto1.discos addObject:d];

    Disco *dd = [[Disco alloc] init];
    dd.nombre = @"ADROMICFMS";
    
    myNumber = @8;
    myInteger = [myNumber integerValue];
    dd.precio = myInteger;
    
    myNumber = @2;
    myInteger = [myNumber integerValue];
    dd.vendidos= myInteger;
    [concierto1.discos addObject:dd];
    [_conciertos addObject:concierto1];
    */
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    InformacionConciertoViewController *informacionConciertoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InformacionConciertoViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:informacionConciertoViewController];
    informacionConciertoViewController.conciertoSeleccionado = [_conciertos objectAtIndex:indexPath.row];
    [self presentViewController:navigationController animated:YES completion:nil];
}

@end
