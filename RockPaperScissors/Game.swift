//
//  Game.swift
//  RockPaperScissors
//
//  Created by JAXON SCHRAUT on 12/14/22.
//

import Foundation


public class Game{
    
    var winner:String
    var loser:String
    var score:(Int,Int)
    
    
    init(winner: String, loser: String, score: (Int, Int)) {
        self.winner = winner
        self.loser = loser
        self.score = score
    }
    
    
    
    func toString()->String{
        return "\(winner) won, and \(loser) lost! The score was \(score.0) to \(score.1)\n"
    }
}
