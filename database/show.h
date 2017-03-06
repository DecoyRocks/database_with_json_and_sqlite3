//
//  show.h
//  database
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface show : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *data;
    NSArray *arrPeopleInfo;
}
@property (nonatomic) NSString* recordIDToEdit;
@property (nonatomic) NSString* recordIDToEditadd;
@property (nonatomic) NSString* recordIDToEditmob;
@property (nonatomic) NSString* recordIDToEditemail;
@property (nonatomic, strong) DBManager *dbManager;



-(void)loadData;

- (IBAction)relode:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tblPeople;

@end
