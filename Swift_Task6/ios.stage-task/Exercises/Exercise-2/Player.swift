//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        guard let handWrapped = hand else { return false }
        
        for cards in handWrapped{
            if cards.value == card.value {
                return true
            }
        }
        
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        guard let handWrapped = hand else { return false }
        
        for card in handWrapped{
            for tableCard in table{
                if card.value == tableCard.value.value || tableCard.key.value == card.value {
                    return true
                }
            }
        }
        
        return false
    }
}
