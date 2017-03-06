//
//  second.m
//  sidebar
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import "second.h"
#import "SWRevealViewController.h"

@implementation second
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarbutton setTarget: self.revealViewController];
        [self.sidebarbutton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

@end
