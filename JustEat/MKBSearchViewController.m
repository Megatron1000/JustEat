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

@property (strong, nonatomic) MKBPostCodeFinder *postCodeFinder;

@end

@implementation MKBSearchViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController respondsToSelector:@selector(setSearchTerm:)])
    {
        [segue.destinationViewController performSelector:@selector(setSearchTerm:) withObject:self.searchTermTextField.text];
    }
}

- (MKBPostCodeFinder*)postCodeFinder
{
    if (_postCodeFinder == nil)
    {
        _postCodeFinder = [[MKBPostCodeFinder alloc]init];
    }
    
    return _postCodeFinder;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self validateTextFieldInputWithString:newString];
    
    return YES;
}

- (void)validateTextFieldInputWithString:(NSString*)newString
{
    self.findRestaurantsButton.enabled = (newString.length > 0);
}

- (IBAction)gpsButtonPressed:(id)sender
{
    [SVProgressHUD show];
    
    __weak typeof(self) weakSelf = self;
    [self.postCodeFinder findCurrentLocationsPostCodeStringWithSuccess:^(NSString *postCodeString) {
        [SVProgressHUD dismiss];
        weakSelf.searchTermTextField.text = postCodeString;
        [weakSelf validateTextFieldInputWithString:postCodeString];
    } andFailure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

@end
