//
//  ScoreViewController.swift
//  PhotoRoulette
//
//  Created by Aarthi on 12/4/22.
//

import UIKit
import Parse

class ScoreViewController: UIViewController {

    var score:Int!
    var players = [PFUser]()
    @IBOutlet weak var firstPlaceWinner: UILabel!
    @IBOutlet weak var yourScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        yourScoreLabel.text = String(score)
        setWinner()
        // Do any additional setup after loading the view.
    }
    
    func setWinner() {
        var winner = players[0]
        for index in 0...(players.count-1) {
            let winner_score = winner["score"] as! Int
            var score = 0;
            if (players[index]["score"] != nil) {
                score = (players[index]["score"] as! Int)
            }
            if (score > winner_score) {
                winner = players[index]
            }
        }
        self.firstPlaceWinner.text = winner.username;
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
