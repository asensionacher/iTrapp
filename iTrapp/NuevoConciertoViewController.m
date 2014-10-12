//
//  NuevoConciertoViewController.m
//  iTrapp
//
//  Created by Sergi Asensio on 02/10/14.
//  Copyright (c) 2014 iTrapp. All rights reserved.
//

#import "NuevoConciertoViewController.h"

@interface NuevoConciertoViewController ()

@end

@implementation NuevoConciertoViewController

void *anadirLabelNombreDisco();

- (void)viewDidLoad {
    [super viewDidLoad];
    _stringArray = [[NSMutableArray alloc] init];
    _subViews = [[NSArray alloc] init];
    _discos = [[NSMutableArray alloc] init];
    _concierto = [[Concierto alloc] init];
    _concierto.discos = [[NSMutableArray alloc]init];
    _posicion = 140;
    _indice = 0;
    
    //anado el precio
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, _posicion, 300, 20)];
    [textField addTarget:self
                    action:@selector(textFieldDidChange:)
          forControlEvents:UIControlEventEditingChanged];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"Nombre del disco";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.tag = _indice;
    //[_nombreDisco addObject: textField];
    _posicion += 20;
    _indice++;
    [self.view addSubview:textField];
    
    [_stringArray addObject:@""];
    
    //anado el precio
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, _posicion, 100, 20)];
    [textField1 addTarget:self
                  action:@selector(textFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];

    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.font = [UIFont systemFontOfSize:15];
    textField1.placeholder = @"Precio";
    textField1.autocorrectionType = UITextAutocorrectionTypeNo;
    textField1.keyboardType = UIKeyboardTypeDefault;
    textField1.returnKeyType = UIReturnKeyDone;
    textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField1.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField1.tag = _indice;
    //[_precioDisco addObject: textField1];
    _posicion += 30;
    [self.view addSubview:textField1];
    [_stringArray addObject:@""];

    _indice++;
    
}
- (IBAction)nuevoButton:(id)sender {
    
    //Anado el disco
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, _posicion, 300, 20)];
    [textField addTarget:self
                  action:@selector(textFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];

    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"Nombre del disco";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //[_nombreDisco addObject: textField];
    textField.tag = _indice;
    _posicion += 20;
    [self.view addSubview:textField];
    [_stringArray addObject:@""];
    
    _indice++;

    
    //anado el precio
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, _posicion, 100, 20)];
    [textField1 addTarget:self
                  action:@selector(textFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];

    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.font = [UIFont systemFontOfSize:15];
    textField1.placeholder = @"Precio";
    textField1.autocorrectionType = UITextAutocorrectionTypeNo;
    textField1.keyboardType = UIKeyboardTypeDefault;
    textField1.returnKeyType = UIReturnKeyDone;
    textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField1.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField1.tag = _indice;
    //[_precioDisco addObject: textField1];
    _posicion += 30;
    [self.view addSubview:textField1];
    [_stringArray addObject:@""];

    _indice++;
    
}
- (IBAction)siguienteButton:(id)sender {
    
    //FERHO AMB LES FUNCIONS DEL UI
    
    _concierto.nombre = _nombreConcierto.text;
    
    for (NSInteger i = 0; i < _indice; i++) {
        NSString *nombreDiscoTexto = [[NSString alloc] init];
        NSString *precioDiscoTexto = [[NSString alloc] init];

        NSLog(@"%@",[_stringArray objectAtIndex:i]);
        NSLog(@"%@",[_stringArray objectAtIndex:i+1]);
        BOOL valid;
        NSCharacterSet *okchars = [NSCharacterSet characterSetWithCharactersInString:@"0123456789-."];
        NSCharacterSet *stringsFromField = [NSCharacterSet characterSetWithCharactersInString:precioDiscoTexto];
        valid = [okchars isSupersetOfSet:stringsFromField];
        nombreDiscoTexto = [_stringArray objectAtIndex:i];
        i++;
        precioDiscoTexto = [_stringArray objectAtIndex:i];
        if (precioDiscoTexto.length > 0 && nombreDiscoTexto.length > 0 && valid) {
            
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            NSNumber * myN = [f numberFromString:precioDiscoTexto];
            
            Disco *disco =[[Disco alloc] init];
            disco.precio = myN;
            disco.nombre = nombreDiscoTexto;
            disco.vendidos = @0;
            [_discos addObject:disco];
        }
    }
    [_concierto.discos addObjectsFromArray:_discos];
    ConciertoViewController *conciertoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConciertoViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:conciertoViewController];
    conciertoViewController.concierto = _concierto;
    [self presentViewController:navigationController animated:YES completion:nil];

}

- (IBAction)textFieldDidChange :(UITextField *)sender
{
    [_stringArray removeObjectAtIndex:sender.tag];
    [_stringArray insertObject:sender.text atIndex:sender.tag];
}




/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        ConciertoViewController *controller = (ConciertoViewController *)navController.topViewController;
        controller.concierto = _concierto;
    }
}*/
     
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
