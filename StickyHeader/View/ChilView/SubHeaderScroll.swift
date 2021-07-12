//
//  SubHeaderScroll.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 12.07.2021.
//

import SwiftUI

struct SubHeaderScroll: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        //Кастомный ScrollView (reader для автоматического)
        ScrollViewReader { svReader in
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 0) {
                    
                    ForEach(tabItems) { item in
                        Text(item.name.rawValue.firstCapitalized)
                            .font(.caption)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.orangeApp
                                            .opacity(viewModel.selectTab == item.name ? 1 : 0))
                            .clipShape(Capsule())
                            .foregroundColor(viewModel.selectTab == item.name ? (scheme == .dark ? .black : .white) : .purpleApp)
                            .id(item.name)
                    }
                    .onChange(of: viewModel.selectTab, perform: { value in
                        withAnimation(.easeInOut) {
                            svReader.scrollTo(viewModel.selectTab, anchor: .leading)
                        }
                    })
                }
            })
            
            //Виден только при прокрутке вверх
            .opacity(viewModel.offset > 200 ? Double((viewModel.offset - 200) / 50) : 0)
        }
    }
}
