//
//  ViewController.h
//  iTrapp
//
//  Created by Sergi Asensio on 29/09/14.
//  Copyright (c) 2014 Sergi Asensio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UITableViewController {
    sqlite3 *bd;
}


@end

