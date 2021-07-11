//
//  HeaderView.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Sticky Header Animation")
                .font(.title)
                .fontWeight(.bold)
            
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
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(Color.white)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
