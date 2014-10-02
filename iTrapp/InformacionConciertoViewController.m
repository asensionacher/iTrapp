//
//  InformacionConciertoViewController.m
//  iTrapp
//
//  Created by Sergi Asensio on 30/09/14.
//  Copyright (c) 2014 iTrapp. All rights reserved.
//

#import "InformacionConciertoViewController.h"

@interface InformacionConciertoViewController ()

@end

@implementation InformacionConciertoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nombreLabel.title = _conciertoSeleccionado.nombre;
    _discoLabel.text = @"HOLA";
    
    _textoDiscos.text = @"";
    for (int i = 0; i < _conciertoSeleccionado.discos.count; i++) {
        Disco *k = [[Disco alloc] init];
        k = [_conciertoSeleccionado.discos objectAtIndex:i];
        NSString *aux = [[NSString alloc] init];
        aux = _textoDiscos.text;
        _textoDiscos.text = [NSString stringWithFormat:@"%@\r %@ - %@", aux, k.nombre, k.vendidos ];
    }
    //Disco *k = [_conciertoSeleccionado.discos objectAtIndex:0];
    //_discoLabel.text = k.nombre;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)atrasButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
