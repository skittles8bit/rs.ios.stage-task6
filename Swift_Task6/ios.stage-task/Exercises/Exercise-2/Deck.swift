import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        if type == .deck36 {
            self.cards = createDeck(suits: Suit.allCases, values: Value.allCases)
        }
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var baseDeck: [Card] = []
        var tempCard: Card = Card(suit: .clubs, value: .six)
        
        for suit in suits{
            for value in values{
                tempCard.suit = suit
                tempCard.value = value
                baseDeck.append(tempCard)
            }
        }
        
        return baseDeck
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        if cards.count == 0 { return }
                
        let trumpSuit = cards[0].suit
        self.trump = trumpSuit
        setTrumpCards(for: trumpSuit)
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        var temp = [Card]()
        
        players.forEach{ player in
            for _ in 0..<6 {
                temp.append(cards[0])
                cards.remove(at: 0)
            }
            
            player.hand = temp
        }
    }

    public mutating func setTrumpCards(for suit: Suit) {
        for i in 0..<cards.count{
            if cards[i].suit == suit {
                cards[i].isTrump = true
            }
        }
    }
}

