//
//  MKBResultsViewController.m
//  
//
//  Created by Mark Bridges on 16/05/2015.
//
//

#import "MKBResultsViewController.h"
#import "MKBRestaurantResultsDataSource.h"
#import "MKBSessionManager.h"
#import "SVProgressHUD.h"

@interface MKBResultsViewController ()

@property (strong, nonatomic) IBOutlet MKBRestaurantResultsDataSource *dataSource;

@end

@implementation MKBResultsViewController


#pragma mark Getters & Setters

- (void)setSearchTerm:(NSString *)searchTerm
{
    self.navigationItem.title = searchTerm;
    
    [self findRestaurantsForSearchTerm:searchTerm];
    
    _searchTerm = searchTerm;
}

- (void)setRestaurants:(NSArray *)restaurants
{
    self.dataSource.restaurants = restaurants;
    [self.tableView reloadData];
    
    _restaurants = restaurants;
}


#pragma mark Refreshing

- (void)findRestaurantsForSearchTerm:(NSString*)searchTerm
{
    MKBSessionManager *sessionManager = [[MKBSessionManager alloc]initForJustEat];
    
    __weak typeof(self) weakSelf = self;
    [SVProgressHUD show];
    
    [sessionManager findRestuarantsNearPostCode:searchTerm
                                    withSuccess:^(NSArray *restaurants) {
                                        [SVProgressHUD dismiss];
                                        weakSelf.restaurants = restaurants;
                                    }
                                     andFailure:^(NSError *error) {
                                         [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                                         [weakSelf.navigationController popViewControllerAnimated:YES];
                                     }];
}

@end
