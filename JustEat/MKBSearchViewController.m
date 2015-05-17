//
//  MKBSearchViewController.m
//  Just Eat Test
//
//  Created by Mark Bridges on 16/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBSearchViewController.h"
#import "MKBResultsViewController.h"
#import "MKBPostCodeFinder.h"
#import "SVProgressHUD.h"


@interface MKBSearchViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTermTextField;
@property (weak, nonatomic) IBOutlet UIButton *findRestaurantsButton;

@end

@implementation MKBSearchViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController respondsToSelector:@selector(setSearchTerm:)])
    {
        [segue.destinationViewController performSelector:@selector(setSearchTerm:) withObject:self.searchTermTextField.text];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];

    self.findRestaurantsButton.enabled = (newString.length > 0);
    
    return YES;
}

- (IBAction)gpsButtonPressed:(id)sender
{
    MKBPostCodeFinder *postCodeFinder = [[MKBPostCodeFinder alloc]init];
    
    [SVProgressHUD show];
    
    __weak typeof(self) weakSelf = self;
    [postCodeFinder findCurrentLocationsPostCodeStringWithSuccess:^(NSString *postCodeString) {
        [SVProgressHUD dismiss];
        weakSelf.searchTermTextField.text = postCodeString;
    } andFailure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

@end
