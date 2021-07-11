//
//  Home.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                //Parallax Header
                
                GeometryReader { gr in
                    Image("StickyHeaderBanner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(height: 250)
                
                //Card
                Section(header: HeaderView()) {
                    
                    ForEach(tabItems) { item in
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            Text(item.name)
                                .font(.title2.bold())
                                .padding(.leading, 20)
                                .padding(.bottom)
                            
                            ForEach(furnitures) { furniture in
                                CardView(furniture: furniture)
                            }
                            
                            Divider()
                                .padding(.top)
                        })
                    }
                }
            })
        }
        .overlay(
            Color.white
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
            , alignment: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
