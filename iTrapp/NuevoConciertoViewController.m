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
    _nombreDisco = [[NSMutableArray alloc] init];
    _precioDisco = [[NSMutableArray alloc] init];
    _discos = [[NSMutableArray alloc] init];
    _posicion = 140;
    
    //anado el precio
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, _posicion, 300, 20)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"Nombre del disco";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_nombreDisco addObject: textField];
    _posicion += 20;
    [self.view addSubview:textField];
    
    //anado el precio
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, _posicion, 100, 20)];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.font = [UIFont systemFontOfSize:15];
    textField1.placeholder = @"Precio";
    textField1.autocorrectionType = UITextAutocorrectionTypeNo;
    textField1.keyboardType = UIKeyboardTypeDefault;
    textField1.returnKeyType = UIReturnKeyDone;
    textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField1.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_precioDisco addObject: textField1];
    _posicion += 30;
    [self.view addSubview:textField1];
    
}
- (IBAction)nuevoButton:(id)sender {
    
    //Anado el disco
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, _posicion, 300, 20)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"Nombre del disco";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_nombreDisco addObject: textField];
    _posicion += 20;
    [self.view addSubview:textField];
    
    //anado el precio
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, _posicion, 100, 20)];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.font = [UIFont systemFontOfSize:15];
    textField1.placeholder = @"Precio";
    textField1.autocorrectionType = UITextAutocorrectionTypeNo;
    textField1.keyboardType = UIKeyboardTypeDefault;
    textField1.returnKeyType = UIReturnKeyDone;
    textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField1.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_precioDisco addObject: textField1];
    _posicion += 30;
    [self.view addSubview:textField1];
    
}

- (IBAction)siguienteButton:(id)sender {
    for (int i = 0; i < _precioDisco.count; i++) {
        UITextField *nombreDisco = [UITextField alloc];
        nombreDisco = _nombreDisco[i];
        UITextField *precioDisco = [UITextField alloc];
        precioDisco = _precioDisco[i];
        
        BOOL valid;
        NSCharacterSet *okchars = [NSCharacterSet characterSetWithCharactersInString:@"0123456789-."];
        NSCharacterSet *stringsFromField = [NSCharacterSet characterSetWithCharactersInString:[precioDisco text]];
        valid = [okchars isSupersetOfSet:stringsFromField];
        
        if (precioDisco.text.length > 0 && nombreDisco.text.length > 0 && valid) {
            
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            NSNumber * myNumber = [f numberFromString:precioDisco.text];
            
            Disco *disco = [Disco alloc];
            disco.precio = myNumber;
            disco.nombre = nombreDisco.text;
            disco.vendidos = @0;
            [_discos addObject:disco];
        }
    }
    
}
     
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)isNumericTextField:(UITextField *)textField{
    
    //Returns TRUE if numeric
    
    BOOL valid;
    
    NSCharacterSet *okchars = [NSCharacterSet characterSetWithCharactersInString:@"0123456789-."];
    
    NSCharacterSet *stringsFromField = [NSCharacterSet characterSetWithCharactersInString:[textField text]];
    
    valid = [okchars isSupersetOfSet:stringsFromField];
    
    return valid;
    
}



@end
