//
//  CreateGameViewController.swift
//  PhotoRoulette
//
//  Created by Shreya Vinjamuri on 11/11/22.
//

import UIKit
import Parse

class CreateGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var players = [PFUser]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerCellTableViewCell;
        if (players.count > 0) {
            cell.setCell(s: players[indexPath.row].username!)
        }
        return cell;
    }
    
    @IBAction func clickReload(_ sender: Any) {
        queryForPlayers(completionHandler: {() in
            self.playersTableView.reloadData();
        });
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playersTableView.delegate = self;
        self.playersTableView.dataSource = self;
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    
    @objc func loadList(notification: NSNotification){
        //load data here
        queryForPlayers(completionHandler: {() in
            self.playersTableView.reloadData();
        });
    }
    

    @IBAction func clickGeneratePin(_ sender: Any) {
        let n = Int.random(in: 100000...999999)
        gamePin.text = String(n);
        let user = PFUser.current();
        let textfieldInt: Int? = Int(gamePin.text!)
        user?["gamePin"] = textfieldInt
        user?.saveInBackground()
        queryForPlayers(completionHandler: {() in
            self.playersTableView.reloadData();
        });
    }
    
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var gamePin: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
