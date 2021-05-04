//
//  ContentView.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/3/21.
//

import SwiftUI

struct ContentView: View {
    /// View Model for the emoji memory game
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack{
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }.aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
            }
        }
            .padding()
            .foregroundColor(.orange)
            .font(viewModel.cards.count >= 5 ? .title : .largeTitle)
    }
}

/// A structure that construct view for a card
struct CardView: View {
    /// The card for view
    var card: MemoryGame<String>.Card
    
    var body: some View {
        if card.isFaceUp {
            ZStack{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
        } else {
            RoundedRectangle(cornerRadius: 10.0).fill()
        }
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
