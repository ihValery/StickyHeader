//
//  Home.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct Home: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                
                //Parallax Header
                ParallaxHeader(viewModel: viewModel)
                
                //Card
                Section(header: HeaderView(viewModel: viewModel)) {
                    
                    BodyWithContex(viewModel: viewModel)
                }
            })
        }
        .overlay(
            (scheme == .dark ? Color.black : Color.white)
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
                .opacity(viewModel.offset > 250 ? 1 : 0)
            , alignment: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(viewModel: ViewModel())
    }
}
