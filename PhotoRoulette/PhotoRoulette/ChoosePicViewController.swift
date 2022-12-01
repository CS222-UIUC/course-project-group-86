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
    
    
    // Connect to front end
    

    
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
      }


    @IBOutlet weak var Answer: UITextField!
   
    @IBAction func Player1Ans(_ sender: Any) {
        if (n == 1) {
            Answer.text = "Correct"
        } else {
            Answer.text = "Sorry, that's wrong!"
        }
    }
    

    @IBAction func Player2Ans(_ sender: Any) {
        if (n == 2) {
            Answer.text = "Correct"
        } else {
            Answer.text = "Sorry, that's wrong!"
        }

    }
    
    @IBAction func Player3Ans(_ sender: Any) {
        if (n == 3) {
            Answer.text = "Correct"
        } else {
            Answer.text = "Sorry, that's wrong!"
        }

    }
    
    @IBAction func Player4Ans(_ sender: Any) {
        if (n == 4) {
            Answer.text = "Correct"
        } else {
            Answer.text = "Sorry, that's wrong!"
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

