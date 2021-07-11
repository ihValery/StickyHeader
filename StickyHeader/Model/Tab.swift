//
//  Tab.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import Foundation

struct Tab: Identifiable {
    var id = UUID().uuidString
    var name: String
    var furnitures: [Furniture]
}

var tabItems: [Tab] = [
    Tab(name: "Chair", furnitures: furnitures.shuffled()),
    Tab(name: "Table", furnitures: furnitures.shuffled()),
    Tab(name: "Sofa", furnitures: furnitures.shuffled()),
    Tab(name: "Buffet", furnitures: furnitures.shuffled())
]
