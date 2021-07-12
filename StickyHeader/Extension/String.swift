//
//  String.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 12.07.2021.
//

import Foundation

extension StringProtocol {
    var firstCapitalized: String {
        prefix(1).capitalized + dropFirst()
    }
}
