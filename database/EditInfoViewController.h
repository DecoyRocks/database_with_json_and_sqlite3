//
//  EditInfoViewController.h
//  SidebarDemo
//
//  Created by Satish on 3/4/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "ViewController.h"

@interface EditInfoViewController : ViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *act_save;
@property (weak, nonatomic) IBOutlet UITextField *txt_name;
@property (weak, nonatomic) IBOutlet UITextField *txt_mobile;
@property (weak, nonatomic) IBOutlet UITextField *txt_address;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
- (IBAction)act_save:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarbutton;
- (IBAction)txt_name:(id)sender;
- (IBAction)txt_address:(id)sender;

- (IBAction)txt_phone:(id)sender;
- (IBAction)email_txt:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *address2lbl;
@property (weak, nonatomic) IBOutlet UILabel *name2lbl;

@property (weak, nonatomic) IBOutlet UILabel *namelbl;
@property (weak, nonatomic) IBOutlet UILabel *addressibl;
@property (weak, nonatomic) IBOutlet UILabel *emaillbl;
@property (weak, nonatomic) IBOutlet UILabel *phonelbl;
@property (weak, nonatomic) IBOutlet UILabel *email2lbl;
@property (weak, nonatomic) IBOutlet UILabel *phone2lbl;

- (IBAction)add:(id)sender;

@end
