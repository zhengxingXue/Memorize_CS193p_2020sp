//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/4/21.
//

import Foundation

extension Array where Element: Identifiable {
    /**
     Return the first index of the element matching the input, otherwise return nil
     - Parameters:
        - matching: the input element to be matched
     */
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id { return index }
        }
        return nil 
    }
}
