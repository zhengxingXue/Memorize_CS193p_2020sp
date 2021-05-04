//
//  Grid.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/4/21.
//

import SwiftUI

/**
 A view that arranges its children in a grid layout
 
 ```
 var body: some View {
     Grid (cards) { Text("Card \($0)") }
 }
 ```
 */
struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    /**
     Create a grid with the given items and viewForItem function
     - parameters:
        - items: the items in the view
        - viewForItem: view builder for the items
     */
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            let index = items.firstIndex(matching: item)!
            viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: index))
        }
    }
}
