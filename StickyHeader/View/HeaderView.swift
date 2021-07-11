//
//  HeaderView.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 0) {
                Button(action: {}, label: {
                    Image(systemName: "arrow.left")
                        .font(.title2.bold())
                        .frame(width: getSize(), height: getSize())
                        .foregroundColor(.primary)
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
            }
            .frame(height: 60)
            
            if homeData.offset > 250 {
                Divider()
            } else {
                Divider().hidden()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(Color.white)
    }
    
    //Получение размера кнопки и создание анимации
    private func getSize() -> CGFloat {
        if homeData.offset > 200 {
            let progress = (homeData.offset - 200) / 50
            
            return progress <= 1 ? progress * 40 : 40
        } else {
            return 0
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
