//
//  regi.m
//  sidebar
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import "regi.h"
#import "login.h"

@implementation regi
@synthesize name,namelbl,email,emaillbl,password,passwordlbl,phone,phonelbl;
BOOL res = true;

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

    [name becomeFirstResponder];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)validation
{
    for (int i=0; i<[jsondata count]; i++) {
        NSDictionary *arrayResult = [jsondata objectAtIndex:i];
        NSString *em = [arrayResult objectForKey:@"email"];
        NSString *pho = [arrayResult objectForKey:@"phone"];
        
        NSString *email1 = email.text;
        NSString *phone1 = phone.text;
        
        
        if ([email1 isEqualToString: em])
        {
            emaillbl.text = @"Email is Already In Used";
            res = false;
        }
        if([phone1 isEqualToString: pho])
        {
            phonelbl.text = @"Phone Number is Already In Used";
            res = false;
        }
    }
    


    if(name.text == nil || [name.text isEqualToString:@""])
    {
        namelbl.text = @"Please Enter Your Name";
        res = false;
    
    }

    if(email.text == nil || [email.text isEqualToString:@""])
    {
        emaillbl.text = @"Please Enter Your email";
        res = false;
    }

    if(password.text == nil || [password.text isEqualToString:@""])
    {
        passwordlbl.text = @"Please Enter Your password";
        res = false;
    }
    if(password.text.length<8)
    {
        passwordlbl.text = @"Please Enter At Least Eight Character";
        res = false;
    }

    if(phone.text == nil || [phone.text isEqualToString:@""])
    {
        phonelbl.text = @"Please Enter Your phonenumber";
        res = false;
    }
    return res;
}
- (IBAction)signup:(id)sender {
    [self validation];
    if(res == true)
    {
        NSDictionary *headers = @{ @"host": @"signup02.restlet.net",
                                   @"accept": @"application/json",
                                   @"content-type": @"application/json",
                                   @"authorization": @"Basic YzVjYzJjMmYtNGUyNC00OWM2LWJiMzgtYTk4MWNhMmVjZjM3Ojk5NGY2N2ZhLWVmMWItNDA1ZS05MDUyLTdhNmVhYjllNGMxZQ==" };
        NSDictionary *parameters = @{ @"id": @"sample id",
                                      @"name": name.text,
                                      @"email":email.text,
                                      @"password": password.text,
                                      @"phone": phone.text};
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://signup02.restlet.net/v1/registers/"]
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:10.0];
        [request setHTTPMethod:@"POST"];
        [request setAllHTTPHeaderFields:headers];
        [request setHTTPBody:postData];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if (error) {
                                                            NSLog(@"%@", error);
                                                        } else {
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                            NSLog(@"%@", httpResponse);
                                                        }
                                                    }];
        [dataTask resume];
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Register Succesfully" message:@"Please Do Login" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            login *view = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
            [self.navigationController pushViewController:view animated:YES];
            
        }];
        [alert addAction:action];
        [self presentViewController:alert  animated:YES completion:nil];
    }
    name.text = @"";
    email.text = @"";
    password.text = @"";
    phone.text = @"";
}


@end
