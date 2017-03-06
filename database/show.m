//
//  show.m
//  database
//
//  Created by Darshan on 3/5/17.
//  Copyright © 2017 Darshan. All rights reserved.
//

#import "show.h"
#import "DBManager.h"
#import "EditInfoViewController.h"
#import "update.h"

@implementation show

- (void)viewDidLoad {

    [super viewDidLoad];
    
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"customer.db"];
    // Do any additional setup after loading the view.
    self.tblPeople.delegate = self;
    self.tblPeople.dataSource = self;
    // Reload the table view.
  
    [self loadData];
    [self.tblPeople reloadData];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    // Form the query.
    NSString *query = @"select * from customer";
    
    // Get the results.
    if (arrPeopleInfo != nil) {
        arrPeopleInfo = nil;
    }
    arrPeopleInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    [self.tblPeople reloadData];
    NSLog(@"%@",arrPeopleInfo);
    data = arrPeopleInfo;
    
}

- (IBAction)relode:(id)sender {
    [self loadData];
    [self.tblPeople reloadData];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrPeopleInfo.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [self.tblPeople registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
   
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSInteger indexOfFirstname = [self.dbManager.arrColumnNames indexOfObject:@"name"];
    NSInteger indexOfAddress = [self.dbManager.arrColumnNames indexOfObject:@"email"];
    NSInteger indexOfmobile = [self.dbManager.arrColumnNames indexOfObject:@"mobile"];
    
    // Set the loaded data to the appropriate cell labels.
    cell.textLabel.text = [NSString stringWithFormat:@"%@ || %@ || %@", [[arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname], [[arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfmobile] , [[arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfAddress]];
    cell.textLabel.font = [UIFont fontWithName:@"Times New Roman" size:14];
    if(indexPath.row %2 == 0)
    {
        cell.backgroundColor = [UIColor orangeColor];
    }
    else
    {
        cell.backgroundColor = [UIColor yellowColor];
    }

    
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ || %@ || %@ ",[[self.arrPeopleInfo objectAtIndex:indexPath.row ] valueForKey:@"name"],[[self.arrPeopleInfo objectAtIndex:indexPath.row]valueForKey:@"address"],[[self.arrPeopleInfo objectAtIndex:indexPath.row]valueForKey:@"mobile"]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"What You Wanna Do" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSInteger indexOfFirstname = [self.dbManager.arrColumnNames indexOfObject:@"name"];
        NSString *recordIDToDelete = [[arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname];
        NSString *query = [NSString stringWithFormat:@"delete from customer where name='%@'", recordIDToDelete];
        
        // Execute the query.
        [self.dbManager executeQuery:query];
        
        // Reload the table view.
        [self loadData];
        
    }];
    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"Update" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        update *update = [self.storyboard instantiateViewControllerWithIdentifier:@"update"];
        NSInteger indexOfFirstname = [self.dbManager.arrColumnNames indexOfObject:@"name"];
        NSInteger indexOfAddress = [self.dbManager.arrColumnNames indexOfObject:@"address"];
        NSInteger indexOfmobile = [self.dbManager.arrColumnNames indexOfObject:@"mobile"];
        NSInteger indexOfemail = [self.dbManager.arrColumnNames indexOfObject:@"email"];
        
        _recordIDToEdit = [[arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname];
        _recordIDToEditadd = [[arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfAddress];
        _recordIDToEditmob = [[arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfmobile];
        _recordIDToEditemail = [[arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfemail];
        //NSLog(@"%@", _recordIDToEdit);
        //update *update = [self.storyboard instantiateViewControllerWithIdentifier:@"update"];
        update.name1 = _recordIDToEdit;
        update.address1 = _recordIDToEditadd;
        update.phone1 = _recordIDToEditmob;
        update.email1 = _recordIDToEditemail;

        [self.navigationController pushViewController:update animated:YES];
        
    }];
    [alert addAction:act1];
    [alert addAction:act2];
    [self presentViewController:alert animated:YES completion:nil];
    

}
//-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
//    // Get the record ID of the selected name and set it to the recordIDToEdit property.
//    NSInteger indexOfFirstname = [self.dbManager.arrColumnNames indexOfObject:@"name"];
//    self.recordIDToEdit = [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname];
//    
//    // Perform the segue.
//    [self performSegueWithIdentifier:@"idSegueEditInfo" sender:self];
//}
 
 







@end
