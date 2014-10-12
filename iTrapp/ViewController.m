//
//  ViewController.m
//  iTrapp
//
//  Created by Sergi Asensio on 29/09/14.
//  Copyright (c) 2014 Sergi Asensio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    [_conciertoss addObject:concierto];
    
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
    [_conciertoss addObject:concierto1];
    */
    NSLog(@"HOLA0");

    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"mydatabase.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
    
    FMResultSet *results = [database executeQuery:@"select * from concierto"];
    while([results next]) {
        
        Concierto *concierto = [[Concierto alloc] init];
        concierto.nombre = [results stringForColumn:@"nombreConcierto"];
        NSLog(@"HOLA");
        NSLog(@"%@",[results stringForColumn:@"nombreConcierto"]);
        NSLog(@"%@",[results stringForColumn:@"recaudado"]);
    }
    
    [database close];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)masButton:(id)sender {
    NuevoConciertoViewController *nuevoConciertoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NuevoConciertoViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:nuevoConciertoViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
    
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

- (void) createEditableCopyOfDatabaseIfNeeded
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"mydatabase.sqlite"];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return;
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"MyDB.sqlite"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}


@end
