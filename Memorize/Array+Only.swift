//
//  Array+Only.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/4/21.
//

import Foundation

extension Array {
    /// The one and only element of the array, otherwise is nil
    var only: Element? {
        count == 1 ? first : nil
    }
}
