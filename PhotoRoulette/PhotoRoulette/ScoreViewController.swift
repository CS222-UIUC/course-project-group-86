//
//  ScoreViewController.swift
//  PhotoRoulette
//
//  Created by Aarthi on 12/4/22.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var showScore: UITextField!
    var score:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showScore.text = String(score)

        // Do any additional setup after loading the view.
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