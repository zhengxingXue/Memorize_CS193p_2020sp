//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/3/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    /// View Model for the emoji memory game
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack{
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card)
                }
                .padding()
            }
        }
            .padding()
            .foregroundColor(.orange)
            .font(.largeTitle)
    }
    
    
}

/// A structure that construct view for a card
struct CardView: View {
    /// The card for view
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMathed {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius : CGFloat = 10
    let edgeLineWidth : CGFloat = 3
    let fontScaleFactor : CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
