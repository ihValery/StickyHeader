//
//  TopPanel.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 12.07.2021.
//

import SwiftUI

struct TopPanel: View {
    var body: some View {
        HStack {
            OneButton(name: "arrow.left")
            Spacer()
            OneButton(name: "suit.heart.fill")
        }
        .padding()
    }
}

struct TopPanel_Previews: PreviewProvider {
    static var previews: some View {
        TopPanel()
    }
}

struct OneButton: View {
    var name: String
    
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: name)
                .font(.title2.bold())
                .foregroundColor(.purpleApp)
        })
    }
}
