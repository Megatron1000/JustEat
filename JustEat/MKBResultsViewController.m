//
//  MKBResultsViewController.m
//  
//
//  Created by Mark Bridges on 16/05/2015.
//
//

#import "MKBResultsViewController.h"
#import "MKBRestaurantResultsDataSource.h"

@interface MKBResultsViewController ()

@property (strong, nonatomic) IBOutlet MKBRestaurantResultsDataSource *dataSource;

@end

@implementation MKBResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)setRestaurants:(NSArray *)restaurants
{
    self.dataSource.restaurants = restaurants;
    [self.tableView reloadData];
    
    _restaurants = restaurants;
}


@end
