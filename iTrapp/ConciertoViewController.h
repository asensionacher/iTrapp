//
//  ConciertoViewController.h
//  iTrapp
//
//  Created by Sergi Asensio on 02/10/14.
//  Copyright (c) 2014 iTrapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Concierto.h"
#import <sqlite3.h>

@interface ConciertoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dineroLabel;
@property(nonatomic) Concierto *concierto;
@property(nonatomic) double *posicion;
@property NSMutableArray *labelArray;
@property sqlite3 *bd;


@end
