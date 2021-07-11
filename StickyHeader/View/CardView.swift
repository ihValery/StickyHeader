//
//  CardView.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import SwiftUI

struct CardView: View {
    var furniture: Furniture
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(furniture.name)
                    .font(.title2.bold())
                Text(furniture.description)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .lineLimit(3)
                Text("$\(furniture.price)")
                    .fontWeight(.bold)
            }
            Spacer()
            
            Image(furniture.image)
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 130)
                .cornerRadius(13)
        }
        .padding(.leading)
        .overlay(RoundedRectangle(cornerRadius: 13)
                    .stroke(Color.gray.opacity(0.3)))
        .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
