//
//  EditViewController.swift
//  RockPaperScissors
//
//  Created by JAXON SCHRAUT on 11/16/22.
//

import UIKit

class EditViewController: UIViewController {

    
    @IBOutlet weak var gameAmtTextField: UITextField!
    
    @IBOutlet weak var statsLabel: UILabel!
    
    var compFavChoice: String = ""
    var compRock: Int = 0
    var compPaper: Int = 0
    var compScissors: Int = 0
    
    var pFavChoice: String = ""
    var pRock: Int = 0
    var pScissors: Int = 0
    var pPaper: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        statsLabel.text = "Computer Stats\nTimes played rock: \(compRock)\nTimes played paper: \(compPaper)\nTimes played scissors: \(compScissors)\n\nPlayer Stats\nTimes played rock: \(pRock)\nTimes played paper: \(pPaper)\nTimes played scissors: \(pScissors)"
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
