//
//  login.m
//  sidebar
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import "login.h"
#import "first.h"


@implementation login
- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *headers = @{ @"host": @"signup02.restlet.net",
                               @"accept": @"application/json",
                               @"content-type": @"application/json",
                               @"authorization": @"Basic YzVjYzJjMmYtNGUyNC00OWM2LWJiMzgtYTk4MWNhMmVjZjM3Ojk5NGY2N2ZhLWVmMWItNDA1ZS05MDUyLTdhNmVhYjllNGMxZQ==" };
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://signup02.restlet.net/v1/registers/"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                    }
                                                    jsondata = [NSJSONSerialization
                                                                JSONObjectWithData:data options:kNilOptions error:nil];
                                                    NSLog(@"%@",jsondata);
                                                }];
    [dataTask resume];
    [_email becomeFirstResponder];
    
    
    // Do any additional setup after loading the view.
}


- (IBAction)signin:(id)sender {
    for (int i=0; i<[jsondata count]; i++) {
        NSDictionary *arrayResult = [jsondata objectAtIndex:i];
        NSString *email = [arrayResult objectForKey:@"email"];
        NSString *passwords = [arrayResult objectForKey:@"password"];
        //  NSLog(@"%@",email);
        //  NSLog(@"%@",password);
        NSString *email1 = _email.text;
        NSString *password1 = _password.text;
        // NSLog(@"%@",email1);
        // NSLog(@"%@",password1);
        
        if ([email1 isEqualToString: email] && [password1 isEqualToString: passwords])
        {
            NSLog(@"Login Sucessful");
            
            res = @"Login Sucessful";
            break;
            
            
        }
        else
        {
            NSLog(@"Login Failed");
            passwordres =@"your email or password is wrong";
            
        }
        
    }
    if([res isEqualToString:@"Login Sucessful"])
    {
        _mainlabel.text = @"";
        _email.text =@"";
        _password.text =@"";
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Succesfully" message:@"Enjoy Our APP" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            first *view = [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
            [self.navigationController pushViewController:view animated:YES];
            
            
        }];
        [alert addAction:action];
        [self presentViewController:alert  animated:YES completion:nil];
       
    }
    else if([passwordres isEqualToString:@"your email or password is wrong"])
    {
        _mainlabel.text = @"Your Email or Password is Wrong";
        _password.text =@"";
        
    }

}
@end
