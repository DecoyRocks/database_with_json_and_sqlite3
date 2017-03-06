//
//  update.h
//  database
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface update : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
- (IBAction)name_act:(id)sender;
- (IBAction)add_act:(id)sender;
- (IBAction)mobile_act:(id)sender;
- (IBAction)email_act:(id)sender;

@property (nonatomic, strong) DBManager *dbManager;
- (IBAction)update:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *mobile;
@property (weak,nonatomic) NSDictionary *transfer;
@property (weak,nonatomic) NSString *name1;
@property (weak,nonatomic) NSString *address1;
@property (weak,nonatomic) NSString *phone1;
@property (weak,nonatomic) NSString *email1;
@end
