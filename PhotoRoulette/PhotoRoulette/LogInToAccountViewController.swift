//
//  LogInToAccountViewController.swift
//  PhotoRoulette
//
//  Created by Shreya Vinjamuri on 10/14/22.
//

import UIKit
import Parse

class LogInToAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    @IBOutlet weak var usernameLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBAction func clickLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground:usernameLabel.text ?? "", password:passwordLabel.text ?? "") {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
            // Do stuff after successful login.
              print("SUCCESS")
              self.performSegue(withIdentifier: "login", sender: nil);
          } else {
            // The login failed. Check error to see why.
          }
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
