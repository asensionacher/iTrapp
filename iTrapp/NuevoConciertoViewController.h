//
//  NuevoConciertoViewController.h
//  iTrapp
//
//  Created by Sergi Asensio on 02/10/14.
//  Copyright (c) 2014 iTrapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Disco.h"
#import "Concierto.h"
#import "ConciertoViewController.h"

@interface NuevoConciertoViewController : UIViewController
@property NSInteger posicion;
@property NSInteger indice;
@property NSArray *subViews;
@property NSMutableArray *stringArray;
@property NSMutableArray *discos;
@property NSMutableArray *arrayStrings;
@property (strong, nonatomic) IBOutlet UITextField *nombreConcierto;
@property Concierto* concierto;
@end
