//
//  TabCatrgory.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import Foundation

enum Category: String {
    case all
    case chair
    case table
    case cupboard
    case sofa
    case buffet
}

struct TabCatrgory: Identifiable {
    var id = UUID().uuidString
    var name: Category
    var furnitures: [Furniture]
}

var tabItems: [TabCatrgory] = [
    TabCatrgory(name: .chair, furnitures: furnitures.filter { $0.category == Category.chair.rawValue }),
    TabCatrgory(name: .table, furnitures: furnitures.filter { $0.category == Category.table.rawValue }),
    TabCatrgory(name: .cupboard, furnitures: furnitures.filter { $0.category == Category.cupboard.rawValue }),
    TabCatrgory(name: .sofa, furnitures: furnitures.filter { $0.category == Category.sofa.rawValue }),
    TabCatrgory(name: .buffet, furnitures: furnitures.filter { $0.category == Category.buffet.rawValue })
]
