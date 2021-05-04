//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/3/21.
//

import Foundation

/// Model for memory game
struct MemoryGame<CardContent> where CardContent: Equatable {
    /// Array containing all the cards in the game
    var cards: [Card]
    
    /// Index of the one and only face up card, otherwise nil
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    /**
     Choose card from cards array and check if the face up cards are matched
     - parameters:
        - card: The card to choose
     */
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMathed {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMathed = true
                    cards[potentialMatchIndex].isMathed = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }

    /**
     Create a memory game with the given number of pairs and card content factory
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
        var isFaceUp: Bool = false
        var isMathed: Bool = false
        var content: CardContent
        var id: Int
    }
}
