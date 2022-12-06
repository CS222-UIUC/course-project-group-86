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
    var pictures = [PFFileObject]()
    var generatedNums = [Int]()
    var score = 0
    var n = 0
    // Connect to front end

    @IBOutlet weak var p1_button: UIButton!
    @IBOutlet weak var p2_button: UIButton!
    @IBOutlet weak var p3_button: UIButton!
    @IBOutlet weak var p4_button: UIButton!
    @IBOutlet weak var Player1name: UILabel!
    @IBOutlet weak var Player2name: UILabel!
    @IBOutlet weak var Player3name: UILabel!
    @IBOutlet weak var Player4name: UILabel!
    @IBOutlet weak var randPic: PFImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queryForPlayers {
            queryForPictures {
                n = Int.random(in: 1...4)
                generatedNums.append(n)
                randPic.file = pictures[n-1]
                randPic.loadInBackground()
            }
        }
        Player1name.text = players[0].username
        Player2name.text = players[1].username
        Player3name.text = players[2].username
        Player4name.text = players[3].username
      }
    
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
   
    @IBAction func Player1Ans(_ sender: Any) {
        if (n == 1) {
            score += 1
            p1_button.backgroundColor = UIColor.green
        } else {
            p1_button.backgroundColor = UIColor.red
        }
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.generateNewImage();
        }
        
    }
    

    @IBAction func Player2Ans(_ sender: Any) {
        if (n == 2) {
            score += 1
            p2_button.backgroundColor = UIColor.green
        } else {
            p2_button.backgroundColor = UIColor.red
        }
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.generateNewImage();
        }
        
    }
    
    @IBAction func Player3Ans(_ sender: Any) {
        if (n == 3) {
            score += 1
            self.p3_button.backgroundColor = UIColor.green
        } else {
            p3_button.backgroundColor = UIColor.red
        }
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.generateNewImage();
        }
        
    }
    
    @IBAction func Player4Ans(_ sender: Any) {
        if (n == 4) {
            score += 1
            self.p4_button.backgroundColor = UIColor.green
        } else {
            p4_button.backgroundColor = UIColor.red
        }
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.generateNewImage();
        }
        
    }
    
    func generateNewImage() {
        if (generatedNums.count == 4) {
            print("DONE");
            self.performSegue(withIdentifier: "toScore", sender: nil);
            PFUser.current()!["score"] = score;
            PFUser.current()?.saveInBackground()
        } else {
            n = Int.random(in: 1...4)
            while (generatedNums.contains(n)) {
                n = Int.random(in: 1...4)
            }
            generatedNums.append(n)
            randPic.file = pictures[n-1] as! PFFileObject
            randPic.loadInBackground()
            p1_button.backgroundColor = UIColor.init(red: 37.0, green: 150.0, blue: 190.0, alpha: 1)
            p2_button.backgroundColor = UIColor.init(red: 37.0, green: 150.0, blue: 190.0, alpha: 1)
            p3_button.backgroundColor = UIColor.init(red: 37.0, green: 150.0, blue: 190.0, alpha: 1)
            p4_button.backgroundColor = UIColor.init(red: 37.0, green: 150.0, blue: 190.0, alpha: 1)
        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let displayVC = segue.destination as! ScoreViewController
        displayVC.score = score
        displayVC.players = players
    }


}

