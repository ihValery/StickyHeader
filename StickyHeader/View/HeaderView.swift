//
//  HeaderView.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            MainHeader(viewModel: viewModel)
            
            ZStack {
                SubHeader(viewModel: viewModel)
                
                //Кастомный ScrollView (reader для автоматического)
                SubHeaderScroll(viewModel: viewModel)
            }
            .frame(height: 60)
            
            if viewModel.offset > 250 {
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
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(viewModel: ViewModel())
    }
}
