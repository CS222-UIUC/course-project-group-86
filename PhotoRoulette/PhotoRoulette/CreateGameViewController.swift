//
//  CreateGameViewController.swift
//  PhotoRoulette
//
//  Created by Shreya Vinjamuri on 11/11/22.
//

import UIKit

class CreateGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        return cell;
    }
    

    override func viewDidAppear(_ animated: Bool) {
        let n = Int.random(in: 100000...999999)
        gamePin.text = String(n);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playersTableView.delegate = self;
        self.playersTableView.dataSource = self;
        // Do any additional setup after loading the view.
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
