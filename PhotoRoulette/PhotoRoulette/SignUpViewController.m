//
//  SignUpViewController.m
//  PhotoRoulette
//
//  Created by Shreya Vinjamuri on 9/29/22.
//

#import "SignUpViewController.h"
#import "Parse/Parse.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.passwordTextField.secureTextEntry = true;
    // Do any additional setup after loading the view.
}

- (IBAction)clickSignUp:(id)sender {
    
    if(self.usernameTextField.text.length > 0 && self.passwordTextField.text.length > 0) {
        PFUser *user = [PFUser user];
        user.username = self.usernameTextField.text;
        user.password = self.passwordTextField.text;;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {   // Hooray! Let them use the app now.
                [self performSegueWithIdentifier:@"toMain" sender:self];
            } else {
                NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
              }
        }];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Missing Fields"
                                   message:@"Enter username and password"
                                   preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {}];

        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
