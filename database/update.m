//
//  update.m
//  database
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import "update.h"
#import "DBManager.h"
#import "show.h"

@implementation update
@synthesize name1,name,email,email1,phone1,mobile,address,address1,transfer,dbManager;
- (void)viewDidLoad {
    

    dbManager = [[DBManager alloc] initWithDatabaseFilename:@"customer.db"];
     NSLog(@"%@",name1);
    name.placeholder = name1;
    email.placeholder = email1;
    mobile.placeholder = phone1;
    address.placeholder = address1;
    [super viewDidLoad];
    [name becomeFirstResponder];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)update:(id)sender {
   
//    NSString *str = [NSString stringWithFormat:@"update customer set name = '%@', address='%@', mobile='%@' , email='%@' where name='%@'",name.text,address.text,mobile.text,email.text,name1];
//    [dbManager executeQuery:str];
//    if (self.dbManager.affectedRows != 0) {
//        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
//        
//        // Inform the delegate that the editing was finished.
//        // [self.delegate editingInfoWasFinished];
//        
//        // Pop the view controller.
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//    else{
//        NSLog(@"Could not execute the query.");
//    }
//
    show *sh = [self.storyboard instantiateViewControllerWithIdentifier:@"show"];
    [self.navigationController pushViewController:sh animated:YES];
    
}
- (IBAction)name_act:(id)sender {
    NSString *str = [NSString stringWithFormat:@"update customer set name = '%@'  where mobile ='%@'",name.text,mobile];
    [dbManager executeQuery:str];
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Inform the delegate that the editing was finished.
        // [self.delegate editingInfoWasFinished];
        
        // Pop the view controller.
        //[self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }

}

- (IBAction)add_act:(id)sender {
    NSString *str = [NSString stringWithFormat:@"update customer set address = '%@'  where name='%@'",address.text,name1];
    [dbManager executeQuery:str];
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Inform the delegate that the editing was finished.
        // [self.delegate editingInfoWasFinished];
        
        // Pop the view controller.
       // [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
    

}

- (IBAction)mobile_act:(id)sender {
    NSString *str = [NSString stringWithFormat:@"update customer set mobile = '%@'  where name ='%@'",mobile.text,name1];
    [dbManager executeQuery:str];
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Inform the delegate that the editing was finished.
        // [self.delegate editingInfoWasFinished];
        
        // Pop the view controller.
        //[self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
    

}

- (IBAction)email_act:(id)sender {
    NSString *str = [NSString stringWithFormat:@"update customer set email = '%@'  where name ='%@'",email.text,name1];
    [dbManager executeQuery:str];
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Inform the delegate that the editing was finished.
        // [self.delegate editingInfoWasFinished];
        
        // Pop the view controller.
       // [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
    

}
@end
