//
//  ViewModel.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
//    var localDataFetcher = LocalDataFetcher()
    
    @Published var offset: CGFloat = 0
    @Published var selectTab = tabItems.first!.name
//    @Published var furnitures: [Furniture]
//
//    init() {
//        self.furnitures = localDataFetcher.load("furnitureData.json")
//    }
}
