//
//  Array+Only.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/4/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
