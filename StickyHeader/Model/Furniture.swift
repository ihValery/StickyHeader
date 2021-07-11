//
//  Furniture.swift
//  StickyHeader
//
//  Created by Валерий Игнатьев on 11.07.2021.
//

import Foundation

struct Furniture: Identifiable {
    var id = UUID().uuidString
    var name: String
    var description: String
    var price: Int
    var image: String
}

var furnitures: [Furniture] = [
    Furniture(name: "Lyrra Chair", description: "Ergonomical for humans body curve. The beautiful Egg chair by Arne Jacobsen is made even prettier and slightly more comfortable with the matching footrest. Arne Jacobsen designed Egg for the lobby and reception areas at the SAS Royal Hotel in Copenhagen. Decorate this classic lightweight armchair with a footrest for a homey, comfortable and beautiful experience. When Arne Jacobsen designed the SAS Royal Hotel in Copenhagen in the late 1950s, he also created the Egg, Swan, Swan sofa, 3300 Series and Drop. With this furniture, Arne Jacobsen rewrote the history of Danish design around the world.", price: 250, image: "chair1red"),
    Furniture(name: "Retro Round", description: "Seating Moder retro Round - Chair. Combining modern geometric lines with a comfortably padded seat, Oslo Counter & Bar lends playful lines a sophistication with a comfortable footrest that allows the user to sit for hours a day. The Oslo Counter & Bar chair brings an elegant touch to any place in the home, restaurant or workplace.", price: 350, image: "chair2red"),
    Furniture(name: "Love Body", description: "For humans body. When Arne Jacobsen designed the SAS Royal Hotel in Copenhagen in the late 1950s, he also created the Egg, Swan, Swan sofa, 3300 Series and Drop. With this furniture, Arne Jacobsen rewrote the history of Danish design around the world.", price: 270, image: "chair4red"),
    Furniture(name: "Circular coffee", description: "The entire table series was inspired by designer Pete Hein's solution to the road problems at Sergels Torg in Stockholm: a super-elliptical circular motion. This version of the oval had some attractive qualities and looked remarkably harmonious regardless of size. The Table series is nothing less than the best quality, which is why FH also found the best quality laminate flooring. Fenix ​​laminate flooring is extremely scratch resistant, and its matte surface accepts light rather than reflects it. It is very easy to clean and does not leave fingerprints. The table top consists of 22 mm laminated chipboard with laminate or veneer. Laminate is available with an aluminum edge, while the veneer version comes with a wooden edge. The base is chrome-plated steel with a base of 4 or 6 stars (at three heights) in polished satin-finished aluminum.", price: 300, image: "table5brown")
]
