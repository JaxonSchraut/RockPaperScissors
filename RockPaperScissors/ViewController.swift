//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by JAXON SCHRAUT on 11/15/22.
//

import UIKit

//Programming elements: variables, operators, if/else statements, Enums, 
//UI elements: ImageViews, Labels, Buttons, ViewController, NavigationController, Constraints, Textfield

class ViewController: UIViewController {

    @IBOutlet weak var scissorsP1Outlet: UIImageView!
    @IBOutlet weak var paperP1Outlet: UIImageView!
    @IBOutlet weak var rockP1Outlet: UIImageView!
    @IBOutlet weak var p1Label: UILabel!
    @IBOutlet weak var p1InstructionLabel: UILabel!
    @IBOutlet weak var p1StatusLabel: UILabel!
    @IBOutlet weak var p2InstructionLabel: UILabel!
    @IBOutlet weak var p2Label: UILabel!
    @IBOutlet weak var p2StatusLabel: UILabel!
    
    
    
    var games = 3
    var wins = 0
    var pPaper = 0
    var pScissors = 0
    var pRock = 0
    var compWins = 0
    var compPaper = 0
    var compRock = 0
    var compScissors = 0
    enum choice{
        case rock
        case paper
        case scissors
    }
    var playerChoice: choice!
    enum outcome{
        case won
        case tie
        case loss
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scissorsP1Outlet.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        paperP1Outlet.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        rockP1Outlet.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        p1Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        p1InstructionLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        p1StatusLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }

    override func viewDidAppear(_ animated: Bool) {
        p1InstructionLabel.text = "First to \(games) wins"
        p2InstructionLabel.text = "First to \(games) wins"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue"{
            let nvc = segue.destination as! EditViewController
            nvc.compScissors = compScissors
            nvc.compPaper = compPaper
            nvc.compRock =  compRock
            nvc.pRock = pRock
            nvc.pPaper = pPaper
            nvc.pScissors = pScissors
        }
    }
    
    
    func compDecision()->choice{
        let rNum = Int.random(in: 1..<101)
        var decision: choice
        if rNum <= 34{
            print("rock")
            decision = .rock
            compRock += 1
        } else if rNum <= 67{
            print("paper")
            decision = .paper
            compPaper += 1
        } else {
            print("scissors")
            decision = .scissors
            compScissors += 1
        }
        return decision
    }
    
    func winning()->outcome{
        var won: outcome
        if playerChoice == .rock{
            if compDecision() == .rock{
                won = .tie
                p1StatusLabel.text = "Tie"
                p2StatusLabel.text = "Tie"
            } else if compDecision() == .paper{
                won = .loss
                p1StatusLabel.text = "Won"
                p2StatusLabel.text = "Lost"
            } else {
                won = .won
                p1StatusLabel.text = "Lost"
                p2StatusLabel.text = "Won"
            }
        } else if playerChoice == .paper{
            if compDecision() == .rock{
                won = .won
                p1StatusLabel.text = "Lost"
                p2StatusLabel.text = "Won"
            } else if compDecision() == .paper{
                won = .tie
                p1StatusLabel.text = "Tie"
                p2StatusLabel.text = "Tie"
            } else {
                won = .loss
                p1StatusLabel.text = "Won"
                p2StatusLabel.text = "Lost"
            }
        } else{
            if compDecision() == .rock{
                won = .loss
                p1StatusLabel.text = "Won"
                p2StatusLabel.text = "Lost"
            } else if compDecision() == .paper{
                won = .won
                p1StatusLabel.text = "Lost"
                p2StatusLabel.text = "Won"
            } else {
                won = .tie
                p1StatusLabel.text = "Tie"
                p2StatusLabel.text = "Tie"
            }
        }
        return won
    }
    
    func checkGames(){
        if wins == games{
            p1InstructionLabel.text = "Game over, Player wins!"
            p1Label.text = "Game over, Player wins!"
            p2Label.text = "Game over, Player wins!"
            p2InstructionLabel.text = "Game over, Player wins!"
        }
        if compWins == games{
            p1InstructionLabel.text = "Game over, Computer wins!"
            p1Label.text = "Game over, Computer wins!"
            p2Label.text = "Game over, Computer wins!"
            p2InstructionLabel.text = "Game over, Computer wins!"
        }
    }
    
    
    
    @IBAction func scissorAction(_ sender: UIButton) {
        playerChoice = .scissors
        pScissors += 1
        if winning() == .won{
            print("won")
            wins+=1
            p2Label.text = "Your wins = \(wins)"
            checkGames()
        } else if winning() == .loss{
            print("lost")
            compWins+=1
            p1Label.text = "Computer wins = \(compWins)"
            checkGames()
        } else {
            p1StatusLabel.text = "Tie"
            p2StatusLabel.text = "Tie"
        }
    }
    @IBAction func paperAction(_ sender: UIButton) {
        playerChoice = .paper
        pPaper += 1
        if winning() == .won{
            print("won")
            wins+=1
            p2Label.text = "Your wins: \(wins)"
            checkGames()
        } else if winning() == .loss{
            print("lost")
            compWins+=1
            p1Label.text = "Your wins = \(compWins)"
            checkGames()
        } else {
            p1StatusLabel.text = "Tie"
            p2StatusLabel.text = "Tie"
        }
    }
    @IBAction func rockAction(_ sender: UIButton) {
        playerChoice = .rock
        pRock += 1
        if winning() == .won{
            print("won")
            wins+=1
            p2Label.text = "You've won \(wins) times"
            checkGames()
        } else if winning() == .loss{
            print("lost")
            compWins+=1
            p1Label.text = "You've won \(compWins) times"
            checkGames()
        } else {
            p1StatusLabel.text = "Tie"
            p2StatusLabel.text = "Tie"
        }
    }
    
    @IBAction func resetButton(_ sender: UIBarButtonItem) {
        wins = 0
        compWins = 0
        p1InstructionLabel.text = "First to \(games) wins"
        p2InstructionLabel.text = "First to \(games) wins"
        p1Label.text = "First to \(games) wins"
        p2Label.text = "First to \(games) wins"
    }
    
    @IBAction func editScreenAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "editSegue", sender: self)
    }
    //class ending bracket
    
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        let svc = unwindSegue.source as! EditViewController
        games = Int(svc.gameAmtTextField.text!)!
    }
}

