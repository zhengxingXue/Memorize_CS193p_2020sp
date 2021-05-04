//
//  ContentView.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/3/21.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack{
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(.orange)
            .font(.largeTitle)
    }
}

struct CardView: View {
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
