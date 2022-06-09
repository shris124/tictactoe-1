//
//  GameViewController.swift
//  tictactoe-1
//
//  Created by iguest on 6/8/22.
//

import UIKit

class GameViewController: UIViewController {
    var state = [0,0,0,0,0,0,0,0,0]
    var count = 0
    var player = 1
    let winState = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1Name.text = UserDefaults.standard.string(forKey: "Player1")
        player2Name.text = UserDefaults.standard.string(forKey: "Player2")
// Do any additional setup after loading the view.
    }
    
    @IBAction func gamePlay(_ sender: UIButton) {
        if state[sender.tag-1] != 0 {
                   return
               }
               
               
               
               if player == 1{
                   state[sender.tag-1] = 1
                   player = 2
                   sender.setBackgroundImage(UIImage(named: "x"), for: .normal)
               }
               else{
                   state[sender.tag-1] = 2
                   player = 1
                   sender.setBackgroundImage(UIImage(named: "o"), for: .normal)
               }
               
               for wins in winState {
                   if ( state[wins[0]] == state[wins[1]] && state[wins[1]] ==
                        state[wins[2]] && state[wins[0]] == 1){
                       let alert = UIAlertController(title: player1Name.text! + " Wins! Another game?", message: nil, preferredStyle: UIAlertController.Style.alert)
                       
                       alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(action: UIAlertAction!) in
                           self.clearBoard()
                       }))
                       alert.addAction(UIAlertAction(title: "No", style: .default, handler: {(action: UIAlertAction!) in
                           let storyboard = UIStoryboard(name: "Main", bundle: nil)
                           let vc = storyboard.instantiateViewController(withIdentifier: "Main")
                           vc.modalPresentationStyle = .overFullScreen
                           self.present(vc, animated: true)
                       }))
                       present(alert,animated: true, completion: nil)
                   }
                   
                   if ( state[wins[0]] == state[wins[1]] && state[wins[1]] ==
                        state[wins[2]] && state[wins[0]] == 2){
                       let alert = UIAlertController(title: player2Name.text! + " Wins! Another game?", message: nil, preferredStyle: UIAlertController.Style.alert)
                       
                       alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(action: UIAlertAction!) in
                           
                           self.clearBoard()
                       }))
                       alert.addAction(UIAlertAction(title: "No", style: .default, handler: {(action: UIAlertAction!) in
                           let storyboard = UIStoryboard(name: "Main", bundle: nil)
                           let vc = storyboard.instantiateViewController(withIdentifier: "Main")
                           vc.modalPresentationStyle = .overFullScreen
                           self.present(vc, animated: true)
                       }))
        
                       present(alert,animated: true, completion: nil)
                   }
                   
                   
                   
               }
               count += 1
               if count == 9 {
                   let alert = UIAlertController(title: "Nobody Wins!", message: nil, preferredStyle: UIAlertController.Style.alert)
                   
                   alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction!) in
                       
                       self.clearBoard()
                   }))
                   present(alert,animated: true, completion: nil)
                   
                   player = 1
                   count = 0
            }
    }
    
    func clearBoard() {
        for i in 0...8 {
            state[i] = 0
            let btn = view.viewWithTag(i+1) as! UIButton
            btn.setBackgroundImage(nil, for: .normal)
        }
        player = 1
        count = 0
    }
    

}
