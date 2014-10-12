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
    Concierto *c = [[Concierto alloc] init];
    c.discos = [[NSMutableArray alloc]init];
    c = [self concierto];
    
    UILabel *textField;
    UILabel *textField1;
    
    for (int i = 0; i < _concierto.discos.count; i++) {
        
        UIStepper *steperCode = [[UIStepper alloc] initWithFrame:CGRectMake(100, (i*30)+120, 300, 200)];
        [steperCode addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        steperCode.maximumValue = 1000;
        steperCode.minimumValue = 0;
        steperCode.stepValue=1.0;
        steperCode.value=0.0;
        steperCode.tag = i;
        
        [self.view addSubview:steperCode];
        
        textField1 = [[UILabel alloc] initWithFrame:CGRectMake(250, (i*30)+120, 300, 20)];
        textField1.font = [UIFont systemFontOfSize:15];
        textField1.text = @"0";
        [_labelArray addObject:textField1];
        [self.view addSubview:textField1];
        
        Disco *d =[[Disco alloc] init];
        
        textField = [[UILabel alloc] initWithFrame:CGRectMake(10, (i*30)+120, 300, 20)];
        textField.font = [UIFont systemFontOfSize:15];
        d = [c.discos objectAtIndex:i];
        textField.text = d.nombre;
        [self.view addSubview:textField];
        
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

    //incrementem en 1
    NSNumber *number = d.vendidos;
    int value = [number intValue];
    number = [NSNumber numberWithInt:value + 1];
    
    d.vendidos = number;
    [_concierto.discos insertObject:d atIndex:sender.tag];
    
    int a = [_dineroLabel.text intValue];
    value = [d.precio intValue];
    value +=a;
    _dineroLabel.text = [@(value) stringValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finButton:(id)sender {
    //GUARDAR TOT A DB
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"mydatabase.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
    
    [database executeUpdate:@"insert into concierto(nombreConcierto, recaudado) values(?,?)",
     _concierto.nombre, _dineroLabel.text,nil];
    FMResultSet *results = [database executeQuery:@"select * from concierto"];
    NSLog(@"HOLA");
    while([results next]) {
        NSLog(@"HOLA");
        NSLog(@"%@",[results stringForColumn:@"nombreConcierto"]);
        NSLog(@"%@",[results stringForColumn:@"recaudado"]);
    }
    for (int i = 0; i < _concierto.discos.count; i++) {
        Disco *d =[[Disco alloc] init];
        d = [_concierto.discos objectAtIndex:i];
        [database executeUpdate:@"insert into disco(nombre, precio, vendidos, concierto) values(?,?,?,?)",
         d.nombre, d.precio, d.vendidos,_concierto.nombre,nil];
        
    }
    
    [database close];
}


@end
