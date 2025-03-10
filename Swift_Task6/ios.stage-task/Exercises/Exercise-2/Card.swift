import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, Codable, CaseIterable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    var suit: Suit
    var value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {
        hasher.combine(suit)
        hasher.combine(value)
        hasher.combine(isTrump)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.suit == rhs.suit && lhs.value == rhs.value && lhs.isTrump == rhs.isTrump
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        if card.isTrump == false && self.isTrump == true {
            return true
        }
        else if self.suit == card.suit{
            return checkValue(card: card)
        }
        
        return false
    }

    func checkValue(card: Card) -> Bool {
        if self.value.rawValue > card.value.rawValue{
            return true
        }
        
        return false
    }
}
