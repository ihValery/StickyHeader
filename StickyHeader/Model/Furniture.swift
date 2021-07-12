//
//  Furniture.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import Foundation

struct Furniture: Identifiable, Codable {
    
    var id: Int
    let name: String
    let category: String
    let description: String
    var isFavorite: Bool
    let price: Int
    let images: [String]
}

var furnitures: [Furniture] = LocalDataFetcher().load("furnitureData.json")
