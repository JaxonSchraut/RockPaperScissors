//
//  EditViewController.swift
//  RockPaperScissors
//
//  Created by JAXON SCHRAUT on 11/16/22.
//

import UIKit

class EditViewController: UIViewController {

    
    
    @IBOutlet weak var statsTextView: UITextView!
    
    
    
    var pFavChoice: String = ""
    var pRock: Int = 0
    var pScissors: Int = 0
    var pPaper: Int = 0
    var display = [Game]()
    var setString: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setString = "Player Stats\nTimes played rock: \(pRock)\nTimes played paper: \(pPaper)\nTimes played scissors: \(pScissors)\nHistory:\n"
        for x in display{
            setString = setString + x.toString()
        }
        statsTextView.text = setString
    }
    

    
}
