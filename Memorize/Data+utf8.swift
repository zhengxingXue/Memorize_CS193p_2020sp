//
//  Data+utf8.swift
//  Memorize
//
//  Created by Jim's MacBook Pro on 5/10/21.
//

import Foundation

extension Data {
    // just a simple converter from a Data to a String
    var utf8: String? { String(data: self, encoding: .utf8 ) }
}
