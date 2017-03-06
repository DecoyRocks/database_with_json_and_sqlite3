//
//  regi.h
//  sidebar
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface regi : UIViewController
{
    NSMutableArray *jsondata;
}
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIButton *signup;
@property (weak, nonatomic) IBOutlet UILabel *namelbl;
@property (weak, nonatomic) IBOutlet UILabel *emaillbl;
@property (weak, nonatomic) IBOutlet UILabel *passwordlbl;
@property (weak, nonatomic) IBOutlet UILabel *phonelbl;
- (IBAction)signup:(id)sender;
@end
