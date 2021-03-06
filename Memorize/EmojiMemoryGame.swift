//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/3/21.
//

import SwiftUI

/// View Model Class for emoji memory game
class EmojiMemoryGame: ObservableObject {
    /// The  Model for emoji memory game
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    /// Create a new memory game model
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "💀", "🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in emojis[pairIndex] }
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
    func choose(_ card: MemoryGame<String>.Card) { model.choose(card) }
    
    func resetGame() { model = EmojiMemoryGame.createMemoryGame() }
}
