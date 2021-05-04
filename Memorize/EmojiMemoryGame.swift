//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/3/21.
//

import SwiftUI

/// View Model Class for emoji memory game
class EmojiMemoryGame {
    /// The  Model for emoji memory game
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    /// Create a new memory game model
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis = ["👻", "💀", "🎃", "💩", "🐶", "♠︎", "♣︎", "♥︎", "♦︎", "♤", "♧", "", "♡"]
        emojis.shuffle()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in emojis[pairIndex] }
    }
    
    // MARK: - Access to the Model
    
    /// Access the model's cards array
    var cards: [MemoryGame<String>.Card] { model.cards }
    
    // MARK: - Intent(s)
    
    /**
     Pass the choose card intent from view to model
     - Parameters:
        - card: the card to choose
     */
    func choose(card: MemoryGame<String>.Card) { model.choose(card: card) }
}
