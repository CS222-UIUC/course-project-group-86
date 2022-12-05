//
//  ChoosePicViewController.swift
//  PhotoRoulette
//
//  Created by Aarthi on 12/1/22.
//

import UIKit
import Parse



class ChoosePicViewController: UIViewController {
    
    var players = [PFUser]()
    var playersID = [String]()
    var pictures = [Any]()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    // Creates a list of players
    func queryForPlayers(completionHandler: () -> ()) {
        let currentPin = PFUser.current()?["gamePin"];
        let query = PFUser.query()
        query?.whereKey("gamePin", equalTo:currentPin!)
        do {
            players = try query?.findObjects() as! [PFUser]
        } catch {
            print(error)
        }
        completionHandler();
    }
    
    
    func queryForPictures(completionHandler: () -> ()) {
        for index in 0...(players.count-1) {
            pictures.append(players[index]["gameImage"] as! PFFileObject)
        }
        completionHandler();
    }
    
    func queryForPlayersID(completionHandler: () -> ()) {
        for index in 0...(players.count-1) {
            playersID.append(players[index]["playerID"] as! String)
        }
        completionHandler();
    }
    
    
    // Connect to front end

   
    @IBOutlet weak var Player1name: UILabel!
    
    
    @IBOutlet weak var Player2name: UILabel!
    
    
    @IBOutlet weak var Player3name: UILabel!
    
    
    @IBOutlet weak var Player4name: UILabel!
    
    @IBOutlet weak var randPic: PFImageView!
    
    var n = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queryForPlayers {
            queryForPictures {
                
                n = Int.random(in: 1...4)
                randPic.file = pictures[n-1] as! PFFileObject
                randPic.loadInBackground()
            }
        }
        Player1name.text = "1"
        Player2name.text = "2"
        Player3name.text = "3"
        Player4name.text = "4"
      }

    var score = 0

    @IBOutlet weak var Answer: UITextField!
   
    @IBAction func Player1Ans(_ sender: Any) {
        if (n == 1) {
            Answer.text = "Correct"
            score += 1
        } else {
            Answer.text = "Sorry, that's wrong!"
        }
    }
    

    @IBAction func Player2Ans(_ sender: Any) {
        if (n == 2) {
            Answer.text = "Correct"
            score += 1
        } else {
            Answer.text = "Sorry, that's wrong!"
        }

    }
    
    @IBAction func Player3Ans(_ sender: Any) {
        if (n == 3) {
            Answer.text = "Correct"
            score += 1
        } else {
            Answer.text = "Sorry, that's wrong!"
        }

    }
    
    @IBAction func Player4Ans(_ sender: Any) {
        if (n == 4) {
            Answer.text = "Correct"
            score += 1
        } else {
            Answer.text = "Sorry, that's wrong!"
        }

    }
    
    @IBAction func ViewScoreSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "SeguetoShowScore", sender: self)
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "SeguetoShowScore"){
                    let displayVC = segue.destination as! ScoreViewController
                    displayVC.score = score
            }

    }


}

