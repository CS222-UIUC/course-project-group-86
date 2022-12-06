//
//  JoinGameViewController.swift
//  PhotoRoulette
//
//  Created by Shreya Vinjamuri on 11/11/22.
//

import UIKit
import Parse

class JoinGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var gamePinTextField: UITextField!
    
    
    @IBAction func clickJoinGame(_ sender: Any) {
        let user = PFUser.current()
        let textfieldInt: Int? = Int(gamePinTextField.text!)
        user?["gamePin"] = textfieldInt
        user?.saveInBackground()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
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
