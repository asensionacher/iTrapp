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
    _nombreLabel.text = _conciertoSeleccionado.nombre;
    _discoLabel.text = @"HOLA";
    NSString *aux;
    for (aux in _conciertoSeleccionado.discos) {
        if( [aux caseInsensitiveCompare:_conciertoSeleccionado.nombre] == NSOrderedSame ) {
            _discoLabel.text = _conciertoSeleccionado.nombre;
            break;
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)atrasButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
