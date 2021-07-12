//
//  BodyWithContex.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 12.07.2021.
//

import SwiftUI

struct BodyWithContex: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ForEach(tabItems) { item in
            VStack(alignment: .leading, spacing: 15, content: {
                
                Text(item.name.rawValue.firstCapitalized)
                    .font(.title2.bold())
                    .foregroundColor(.purpleApp)
                    .padding(.leading, 20)
                    .padding(.bottom)
                
                ForEach(item.furnitures) { furniture in
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
                    if offset < height && offset > 50 && viewModel.selectTab != item.name {
                        DispatchQueue.main.async {
                            viewModel.selectTab = item.name
                        }
                    }
                    
                    return Text("")
                })
        }
    }
}


struct BodyWithContex_Previews: PreviewProvider {
    static var previews: some View {
        BodyWithContex(viewModel: ViewModel())
    }
}
