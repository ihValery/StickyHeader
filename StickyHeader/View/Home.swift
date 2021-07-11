//
//  Home.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    @Environment(\.colorScheme) var scheme
    
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
                            .overlay(
                                HStack {
                                    Button(action: {}, label: {
                                        Image(systemName: "arrow.left")
                                            .font(.title2.bold())
                                            .foregroundColor(.purpleApp)
                                    })
                                    Spacer()
                                    
                                    Button(action: {}, label: {
                                        Image(systemName: "suit.heart.fill")
                                            .font(.title2.bold())
                                            .foregroundColor(.purpleApp)
                                    })
                                }
                                .padding()
                                , alignment: .top
                            )
                    )
                }
                .frame(height: 250)
                
                //Card
                Section(header: HeaderView()) {
                    
                    ForEach(tabItems) { item in
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            Text(item.name)
                                .font(.title2.bold())
                                .foregroundColor(.purpleApp)
                                .padding(.leading, 20)
                                .padding(.bottom)
                            
                            ForEach(furnitures) { furniture in
                                CardView(furniture: furniture)
                            }
                            
                            Divider()
                                .padding(.top)
                        })
                        .tag(item.name)
                        .overlay(
                            GeometryReader { gr -> Text in
                                //Расчет для определения какая вкладка
                                let offset = gr.frame(in: .global).minY
                                let height = UIApplication.shared.windows.first!.safeAreaInsets.top + 100 //+ height Header
                                if offset < height && offset > 50 && homeData.selectTab != item.name {
                                    DispatchQueue.main.async {
                                        homeData.selectTab = item.name
                                    }
                                }
                                    
                                return Text("")
                            })
                    }
                }
            })
        }
        .overlay(
            (scheme == .dark ? Color.black : Color.white)
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
