//
//  MainHeader.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 12.07.2021.
//

import SwiftUI

struct MainHeader: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
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
    }
    
    //Получение размера кнопки и создание анимации
    private func getSize() -> CGFloat {
        guard viewModel.offset > 50 else { return 0 }
        let progress = (viewModel.offset - 50) / 50
        
        return progress <= 1 ? progress * 40 : 40
    }
}

struct MainHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainHeader(viewModel: ViewModel())
    }
}
