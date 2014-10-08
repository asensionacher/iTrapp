//
//  Disco.h
//  iTrapp
//
//  Created by Sergi Asensio on 30/09/14.
//  Copyright (c) 2014 iTrapp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Disco : NSObject

@property (assign, nonatomic) NSString* nombre;
@property (assign, readwrite) NSNumber* precio;
@property (assign, readwrite) NSNumber* vendidos;

@end
