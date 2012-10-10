//
//  SelectionUserView.m
//  SelfHub
//
//  Created by Anton on 08.10.12.
//
//

#import "SelectionUserView.h"

@interface SelectionUserView ()

@end

@implementation SelectionUserView

@synthesize exitButton;
@synthesize UsersTableView,Userlist,FooterView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil loadlist:(NSArray *) list
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.Userlist = list;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    //////удалить/////
    ///*
    WorkWithWithings *user = [[WorkWithWithings alloc] init];
    user.account_email = @"bis@hintsolutions.ru";
    user.account_password = @"AllSystems1";
    self.Userlist = [user getUsersListFromAccount];
   // */
     ////////
    
    NSLog(@"viewDidLoad");
   // self.Userlist = [NSArray arrayWithObjects: @"lol1", @"lol2", @"lol3", nil];
    self.UsersTableView.rowHeight = 45;
    
    int t = ([Userlist count] *  self.UsersTableView.rowHeight) + 25;
    
    if ( t > [[UIScreen mainScreen] applicationFrame].size.height ) {
        t = [[UIScreen mainScreen] applicationFrame].size.height - 10 - 49;
    }else{
        self.UsersTableView.scrollEnabled = false;
    }
    
    [ self.UsersTableView setFrame:CGRectMake(0, 0, 320,t )];
  
    self.UsersTableView.backgroundColor = [UIColor colorWithRed:203/255.f green:203/255.f blue:203/255.f alpha:1.0];
    self.FooterView.backgroundColor = [UIColor clearColor];
    self.UsersTableView.tableFooterView =  self.FooterView;
    self.UsersTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //фон аблицы //
    //self.UsersTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gradientBackground.png"]];
    
    [super viewDidLoad];
     
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.Userlist = nil;
    self.UsersTableView = nil;
    self.FooterView = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
}

// описание таблицы

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection");
  
    return [Userlist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    WBSAPIUser *user = [[WBSAPIUser alloc] init];
    user = [Userlist objectAtIndex:indexPath.row ];
    cell.name.text =[user firstname];
    [user release];
    return cell;
}

- (IBAction)clickButton:(id)sender {
    NSLog(@"click button");
   // [sender resignFirstResponder];
}

@end
