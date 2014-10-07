//
//  ConciertoViewController.m
//  iTrapp
//
//  Created by Sergi Asensio on 02/10/14.
//  Copyright (c) 2014 iTrapp. All rights reserved.
//

#import "ConciertoViewController.h"

@interface ConciertoViewController ()

@end

@implementation ConciertoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dineroLabel.text = @"0€";
    _labelArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < _concierto.discos.count; i++) {
        
        UILabel *textField = [[UILabel alloc] initWithFrame:CGRectMake(10, (i*30)+120, 300, 20)];
        textField.font = [UIFont systemFontOfSize:15];
        Disco *d = [ _concierto.discos objectAtIndex: (i)];
        textField.text = d.nombre;
        [self.view addSubview:textField];
        
        UIStepper *steperCode = [[UIStepper alloc] initWithFrame:CGRectMake(100, (i*30)+120, 300, 200)];
        [steperCode addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        steperCode.maximumValue = 1000;
        steperCode.minimumValue = 0;
        steperCode.stepValue=1.0;
        steperCode.value=0.0;
        steperCode.tag = i;
        
        [self.view addSubview:steperCode];
        
        
        UILabel *textField1 = [[UILabel alloc] initWithFrame:CGRectMake(250, (i*30)+120, 300, 20)];
        textField1.font = [UIFont systemFontOfSize:15];
        textField1.text = @"0";
        [_labelArray addObject:textField1];
        [self.view addSubview:textField1];
        
    }
    
}

- (IBAction)valueChanged:(UIStepper *)sender
{
    UILabel *textField = [[UILabel alloc] init];
    textField = [_labelArray objectAtIndex:sender.tag];
    [_labelArray removeObjectAtIndex:sender.tag];
    NSNumber *myDoubleNumber = [NSNumber numberWithDouble:sender.value];
    textField.text = [myDoubleNumber stringValue];
    [_labelArray insertObject:textField atIndex:sender.tag];
    
    
    Disco *d =[[Disco alloc] init];
    d = [_concierto.discos objectAtIndex:sender.tag];
    [_concierto.discos removeObjectAtIndex:sender.tag];
    d.vendidos = d.vendidos + 1;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
