//
//  ChooseGameViewController.swift
//  PhotoRoulette
//
//  Created by Shreya Vinjamuri on 10/14/22.
//

import UIKit
import Parse

class ChooseGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = PFUser.current()?.username;
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
