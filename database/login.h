//
//  login.h
//  sidebar
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface login : UIViewController
{
    NSMutableArray *jsondata;
    NSString *passwordres;
    NSString *res;
}
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)signin:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *mainlabel;

@end
