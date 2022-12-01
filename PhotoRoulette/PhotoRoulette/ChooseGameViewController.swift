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
 
        // Do any additional setup after loading the view.
        self.createGameButton.layer.cornerRadius = 3;
        self.joinGameButton.layer.cornerRadius = 3;
        usernameLabel.text = PFUser.current()?.username;
        self.navigationItem.setHidesBackButton(true, animated:true);


    }
    
    
    @IBOutlet weak var createGameButton: UIButton!
    
    
    @IBOutlet weak var joinGameButton: UIButton!
    
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
