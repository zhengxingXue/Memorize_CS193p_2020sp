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
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame() {
        didSet {
            // UserDefaults.standard.set(model.theme.json, forKey: EmojiMemoryGame.untitled)
            // print("json = \(model.theme.json?.utf8 ?? "nil")")
        }
    }
    
    // private static let untitled = "Memorize.Untitled"
    
    private static let themeArray = [
        MemoryGame<String>.Theme(name: "Halloween", contents: ["👻", "💀", "🎃"], numberOfPairsOfCards: 3, color: .orange),
        MemoryGame<String>.Theme(name: "Animals", contents: ["🐈", "🐶", "🐷"], numberOfPairsOfCards: 3, color: .blue),
        MemoryGame<String>.Theme(name: "Sports", contents: ["🏐", "🎾", "⚾️", "🏀", "🏈", "🏓"], numberOfPairsOfCards: 6, color: .red)
    ]
    
    /// Create a new memory game model
    static func createMemoryGame() -> MemoryGame<String> {
        let theme = themeArray.randomElement()!
        return MemoryGame<String>(theme: theme) { pairIndex in theme.contents[pairIndex] }
    }
    
    // MARK: - Access to the Model
    
    /// Access the model's cards array
    var cards: [MemoryGame<String>.Card] { model.cards }
    
    var themeName: String { model.theme.name }
    
    var themeColor: Color { Color(model.theme.color) }
    
    var score : Int { model.score }
    
    // MARK: - Intent(s)
    
    /**
     Pass the choose card intent from view to model
     - Parameters:
        - card: the card to choose
     */
    func choose(_ card: MemoryGame<String>.Card) { model.choose(card) }
    
    func newGame() { model = EmojiMemoryGame.createMemoryGame() }
}
