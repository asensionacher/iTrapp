//
//  InformacionConciertoViewController.h
//  iTrapp
//
//  Created by Sergi Asensio on 30/09/14.
//  Copyright (c) 2014 iTrapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Concierto.h"

@interface InformacionConciertoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nombreLabel;
@property (strong, nonatomic) IBOutlet UILabel *discoLabel;

@property Concierto *conciertoSeleccionado;

@end

