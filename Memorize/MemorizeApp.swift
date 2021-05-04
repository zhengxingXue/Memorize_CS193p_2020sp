//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/3/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
