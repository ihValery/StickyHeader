//
//  Home.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct Home: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                
                //Parallax Header
                ParallaxHeader(viewModel: viewModel)
                
                //Card
                Section(header: HeaderView(viewModel: viewModel)) {
                    
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
