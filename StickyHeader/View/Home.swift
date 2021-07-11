//
//  Home.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                
                //Parallax Header
                GeometryReader { gr -> AnyView in
                    let offset = gr.frame(in: .global).minY
                    
//                    if -offset >= 0 {
                    //Что бы спрятать скролл в безопасной зоне
                        DispatchQueue.main.async {
                            homeData.offset = -offset
                        }
//                    }
                    
                    return AnyView(
                        Image("StickyHeaderBanner")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: 250 + (offset > 0 ? offset : 0))
                            .cornerRadius(1)  //Тут для обрезки
                            .offset(y: offset > 0 ? -offset : 0)
                    )
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
                .opacity(homeData.offset > 250 ? 1 : 0)
            , alignment: .top)
        //Использовать объект среды для доступа ко всем под объектам
        .environmentObject(homeData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
