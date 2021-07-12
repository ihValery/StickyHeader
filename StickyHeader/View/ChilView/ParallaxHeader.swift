//
//  ParallaxHeader.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 12.07.2021.
//

import SwiftUI

struct ParallaxHeader: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        GeometryReader { gr -> AnyView in
            let offset = gr.frame(in: .global).minY
            
//            if -offset >= 0 {
                //Что бы спрятать скролл в безопасной зоне
                DispatchQueue.main.async {
                    viewModel.offset = -offset
                }
//            }
            
            return AnyView(
                Image("StickyHeaderBanner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width,
                           height: 250 + (offset > 0 ? offset : 0))
                    .cornerRadius(1)  //Тут для обрезки
                    .offset(y: offset > 0 ? -offset : 0)
                    .overlay(
                        TopPanel()
                            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                            .offset(y: offset > 0 ? -offset : 0)
                        , alignment: .top)
            )
        }
        .frame(height: 250)
    }
}

struct ParallaxHeader_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxHeader(viewModel: ViewModel())
    }
}
