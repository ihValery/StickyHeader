//
//  ViewModel.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
    @Published var selectTab = tabItems.first!.name
}
