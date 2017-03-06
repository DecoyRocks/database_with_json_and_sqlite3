//
//  EditInfoViewController.m
//  SidebarDemo
//
//  Created by Satish on 3/4/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "EditInfoViewController.h"
#import "DBManager.h"
#import "ViewController.h"
#import "SWRevealViewController.h"



@interface EditInfoViewController ()
{
    NSArray *data;
}
@property (nonatomic, strong) DBManager *dbManager;
@end

@implementation EditInfoViewController
@synthesize namelbl,emaillbl,phonelbl,addressibl;
BOOL results = true;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txt_email.delegate = self;
    self.txt_name.delegate = self;
    self.txt_mobile.delegate = self;
    self.txt_address.delegate = self;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"customer.db"];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarbutton setTarget: self.revealViewController];
        [self.sidebarbutton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    [_txt_name becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)act_save:(id)sender {

    
    if([_txt_name.text isEqual:@""] && [_txt_mobile.text isEqual: @""])
    {
        if([_txt_name.text isEqual:@""])
        {
            namelbl.text = @"Please Enter Name";
        }
        if([_txt_mobile.text isEqual:@""])
        {
        phonelbl.text = @"Please Enter Mobile";
        }
    }
    else{
    NSString *query = [NSString stringWithFormat:@"insert into customer values('%@', '%@', '%@' , '%@')", self.txt_name.text, self.txt_address.text, self.txt_mobile.text , self.txt_email.text];
   
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
        }
    }
    _txt_mobile.text =@"";
    _txt_email.text =@"";
   _txt_name.text =@"";
    _txt_address.text =@"";
}




- (IBAction)add:(id)sender {
    
    ViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"view"];
    [self.navigationController pushViewController:view animated:YES];
}
- (IBAction)txt_name:(id)sender {
    if([_txt_name.text isEqualToString:@""])
    {
        namelbl.text = @"Please Enter Your Name";
        results = false;
    }
    else
    {
        namelbl.text = @"";
    }

}

- (IBAction)txt_address:(id)sender {
    if([_txt_address.text isEqualToString: @""])
    {
        addressibl.text = @"Please Enter Your Address.";
        results = false;
    }
    else
    {
        addressibl.text = @"";
    }

    
}



- (IBAction)txt_phone:(id)sender {
    if([_txt_mobile.text isEqualToString: @""])
    {
        phonelbl.text = @"Please Enter Your Mobile No.";
        results = false;
    }
    else
    {
        phonelbl.text = @"";
    }
}

- (IBAction)email_txt:(id)sender {
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    //Valid email address
    if ([_txt_email.text isEqual:@""]) {
        emaillbl.text = @"";
    }
    else{
        if ([emailTest evaluateWithObject:_txt_email.text] == YES)
        {
            //Do Something
            emaillbl.text = @"";
        }
        else
        {
            emaillbl.text = @"Please Enter Valid Email";
        }
    }

}






//- (IBAction)emailnew:(id)sender {
//    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
//    
//    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
//    if([_txt_email.text isEqualToString:@""])
//    {
//        _email2lbl.text = @"";
//    }
//    else {
//        
//        if([emailTest evaluateWithObject:_txt_email.text] == NO)
//        {
//            _email2lbl.text = @"*";
//        }
//        else
//        {
//            _email2lbl.text = @"";
//        }
//    }
//
//}

@end
