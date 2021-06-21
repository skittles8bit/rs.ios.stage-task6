//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var turnPlayer = Player()
        var temp = 0
        
        players.forEach{ player in
            guard let hand = player.hand else { return }
            
            hand.forEach{ card in
                guard let cardValue = Value.allCases.firstIndex(where: { $0 == card.value }) else { return }
                
                if card.isTrump && cardValue < temp {
                    temp = cardValue
                    turnPlayer = player
                }
            }
            
        }
        
        return turnPlayer
    }
}
