//
//  table.h
//  sidebar
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface table : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *menuItems;
}

@end
