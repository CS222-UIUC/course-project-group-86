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
        if (usernameLabel.text == "") {
            let alert = UIAlertController(title: "Empty Username", message: "Please Enter a Username", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if (passwordLabel.text == "") {
            let alert = UIAlertController(title: "Empty Password", message: "Please Enter a Password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        PFUser.logInWithUsername(inBackground:usernameLabel.text ?? "", password:passwordLabel.text ?? "") {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
            // Do stuff after successful login.
              print("SUCCESS")
              self.performSegue(withIdentifier: "login", sender: nil);
          } else {
            // The login failed. Check error to see why.
              let alert = UIAlertController(title: "Invalid", message: "Wrong Password / Username", preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
              self.present(alert, animated: true, completion: nil)
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
