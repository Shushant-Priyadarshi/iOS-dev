//
//  fruitcard.view.swift
//  shoppingApp
//
//  Created by Shushant  on 11/08/25.
//

import SwiftUI

let images : FruitModel = FruitModel(id: 1, title: fruitTitle.apple, image: "apple", price: "$2.33", color: "1", desc:"Apples are grown naturally to offer high-quality, nutrient-rich fruit that supports overall wellness.",deliveryTime: "40-50 Min")

struct FruitcardView: View {
    let fruits : FruitModel
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing:5){
                Text(fruits.title.rawValue.uppercased(with: .autoupdatingCurrent))
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundStyle(.black)
                Text(fruits.price)
                    .font(.title3)
                    .foregroundStyle(.black.opacity(0.7))
                Spacer()
            }
            .padding()
            .frame(width: 175,height: 150, alignment: .center)
            .background(Color(fruits.color))
            .cornerRadius(30)
            .padding()
            
            Image(fruits.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 110)
                .offset(y:60)
     
        }
        .frame(width: 175, height: 250, alignment: .center)
    }
}

#Preview {
    FruitcardView(fruits: images)
}
