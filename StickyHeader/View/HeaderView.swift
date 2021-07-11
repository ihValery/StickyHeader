//
//  HeaderView.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var homeData: HomeViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 0) {
                Button(action: {}, label: {
                    Image(systemName: "arrow.left")
                        .font(.title2.bold())
                        .frame(width: getSize(), height: getSize())
                        .foregroundColor(.purpleApp)
                })
                Text("Sticky Header")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            ZStack {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Chair . Table . Sofa . Buffet")
                        .font(.caption)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                        Text("30-40 min")
                        Text("4.3")
                        Image(systemName: "star.fill")
                        Text("$6.30 Free")
                            .padding(.leading, 10)
                    }
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                })
                .opacity(homeData.offset > 200 ? Double(1 - (homeData.offset - 200) / 50) : 1)
                
                //Кастомный ScrollView (reader для автоматического)
                ScrollViewReader { svReader in
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 0) {
                            
                            ForEach(tabItems) { item in
                                Text(item.name)
                                    .font(.caption)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(Color.orangeApp
                                                    .opacity(homeData.selectTab == item.name ? 1 : 0))
                                    .clipShape(Capsule())
                                    .foregroundColor(homeData.selectTab == item.name ? (scheme == .dark ? .black : .white) : .purpleApp)
                                    .id(item.name)
                            }
                            .onChange(of: homeData.selectTab, perform: { value in
                                withAnimation(.easeInOut) {
                                    svReader.scrollTo(homeData.selectTab, anchor: .leading)
                                }
                            })
                        }
                    })
                    
                    //Виден только при прокрутке вверх
                    .opacity(homeData.offset > 200 ? Double((homeData.offset - 200) / 50) : 0)
                }
            }
            .frame(height: 60)
            
            if homeData.offset > 250 {
                Divider()
            } else {
                Divider().hidden()
            }
        }
        .foregroundColor(.purpleApp)
        .padding(.horizontal)
        .frame(height: 100)
        .background(scheme == .dark ? Color.black : Color.white)
    }
    
    //Получение размера кнопки и создание анимации
    private func getSize() -> CGFloat {
        guard homeData.offset > 200 else { return 0 }
        let progress = (homeData.offset - 200) / 50
        
        return progress <= 1 ? progress * 40 : 40
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
