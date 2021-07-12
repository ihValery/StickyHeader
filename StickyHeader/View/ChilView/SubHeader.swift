//
//  SubHeader.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 12.07.2021.
//

import SwiftUI

struct SubHeader: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text("Chair . Table . Cupboard . Sofa . Buffet")
                .font(.caption)
            
            HStack(spacing: 8) {
                Text("Best furniture")
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                }
                .foregroundColor(.orangeApp)
            }
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .leading)
        })
        .opacity(viewModel.offset > 200 ? Double(1 - (viewModel.offset - 200) / 50) : 1)
    }
}

struct SubHeader_Previews: PreviewProvider {
    static var previews: some View {
        SubHeader(viewModel: ViewModel())
    }
}
