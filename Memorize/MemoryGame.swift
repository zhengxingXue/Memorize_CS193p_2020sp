//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/3/21.
//

import Foundation

/// Model for memory game
struct MemoryGame<CardContent> {
    /// Array containing all the cards in the game
    var cards: [Card]
    
    /**
     Choose card from cards array
     - parameters:
        - card: The card to choose
     */
    mutating func choose(_ card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id { return index }
        }
        return 0 // TODO: bogus!
    }
    
    /**
     Initialize the memory game
     - parameters:
        - numberOfPairsOfCards: The number of pairs of cards to be initialized
        - cardContentFactory: The function that takes Integer as input and output CardContent
     */
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    /// Single card for memory game
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMathed: Bool = false
        var content: CardContent
        var id: Int
    }
}
