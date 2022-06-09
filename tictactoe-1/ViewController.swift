//
//  ViewController.swift
//  tictactoe-1
//
//  Created by iguest on 6/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1Name: UITextField!
    @IBOutlet weak var player2Name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    @IBAction func addPlayerName(_ sender: Any) {
        
               let defaults = UserDefaults.standard
               defaults.set(player1Name.text, forKey: "Player1")
               defaults.set(player2Name.text, forKey: "Player2")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "Game")
               vc.modalPresentationStyle = .overFullScreen
               self.present(vc, animated: true)
    }
    
}

