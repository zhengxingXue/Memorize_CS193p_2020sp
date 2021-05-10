//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/3/21.
//

import Foundation
import SwiftUI

/// Model for memory game
struct MemoryGame<CardContent> where CardContent: Equatable, CardContent: Codable {
    /// Array containing all the cards in the game
    var cards: [Card]
    
    var theme: Theme
    
    var score: Int
    
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
     Choose card from cards array, check if the face up cards are matched, and update score
     - parameters:
        - card: The card to choose
     */
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMathed {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMathed = true
                    cards[potentialMatchIndex].isMathed = true
                    score += 2
                } else {
                    score -= cards[chosenIndex].isSeen ? 1 : 0
                    score -= cards[potentialMatchIndex].isSeen ? 1 : 0
                    cards[chosenIndex].isSeen = true
                    cards[potentialMatchIndex].isSeen = true
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
        - theme: The theme of the game
        - cardContentFactory: The function that takes Integer as input and output CardContent
     */
    init(theme: Theme, cardContentFactory: (Int) -> CardContent) {
        self.theme = theme
        score = 0
        cards = [Card]()
        for pairIndex in 0..<theme.numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
        // A5
        print("json = \(self.theme.json?.utf8 ?? "nil")")
    }
    
    /// Single card for memory game
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMathed: Bool = false
        var isSeen: Bool = false
        var content: CardContent
        var id: Int
    }
    
    /// Theme for memory game
    struct Theme: Codable {
        let name : String
        let contents : [CardContent]
        let numberOfPairsOfCards : Int
        let color : UIColor.RGB
        
        init(name: String, contents: [CardContent], numberOfPairsOfCards: Int, color : UIColor) {
            self.name = name
            self.contents = contents
            self.numberOfPairsOfCards = numberOfPairsOfCards
            self.color = color.rgb
        }
        
        var json: Data? {
            return try? JSONEncoder().encode(self)
        }
    }
}
