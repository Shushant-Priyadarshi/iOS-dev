//
//  top-selling.view.swift
//  shoppingApp
//
//  Created by Shushant  on 11/08/25.
//

import SwiftUI

struct TopSellingView: View {
   

        let fruitsArray: [FruitModel] = [
            .init(id: 0, title: .apple, image: "apple", price: "$1.99 each", color: "1",
                  desc: "Apples are grown naturally to offer high-quality, nutrient-rich fruit that supports overall wellness.",deliveryTime: "20-25 Min"),
            .init(id: 1, title: .apricot, image: "apricot", price: "$2.04 each", color: "2",
                  desc: "Apricots are cultivated without harmful chemicals, providing a sweet, wholesome snack.",deliveryTime: "15-2 Min"),
            .init(id: 2, title: .avocado, image: "avocado", price: "$1.04 each", color: "3",
                  desc: "Avocados are organically grown to ensure healthy fats and essential nutrients in every bite.",deliveryTime: "35-40 Min"),
            .init(id: 3, title: .banana, image: "banana", price: "$2.06 each", color: "4",
                  desc: "Bananas are raised naturally, offering potassium-rich goodness for daily energy and health.",deliveryTime: "20-25 Min"),
            .init(id: 4, title: .cherry, image: "cherry", price: "$3.00 each", color: "5",
                  desc: "Cherries are cultivated chemical-free, delivering rich flavor and antioxidants for vitality.",deliveryTime: "15-20 Min"),
            .init(id: 5, title: .dragonfruit, image: "dragonfruit", price: "$1.04 each", color: "6",
                  desc: "Dragonfruits are grown sustainably, providing vibrant color and natural nutrients.",deliveryTime: "35-40 Min"),
            .init(id: 6, title: .fig, image: "fig", price: "$2.00 each", color: "1",
                  desc: "Figs are nurtured organically to offer fiber-rich sweetness that benefits digestion.",deliveryTime: "10-15 Min"),
            .init(id: 7, title: .orange, image: "orange", price: "$1.00 each", color: "2",
                  desc: "Oranges are grown naturally to provide vitamin C and fresh citrus flavor for well-being.",deliveryTime: "20-30 Min"),
            .init(id: 8, title: .grapes, image: "grapes", price: "$2.54 each", color: "3",
                  desc: "Grapes are produced without synthetic additives, offering juicy sweetness and antioxidants.",deliveryTime: "55-60 Min"),
            .init(id: 9, title: .raspberry, image: "raspberry", price: "$3.04 each", color: "4",
                  desc: "Raspberries are organically raised, delivering tart flavor and health-boosting nutrients.",deliveryTime: "35-40 Min"),
            .init(id: 10, title: .papaya, image: "papaya", price: "$1.04 each", color: "5",
                  desc: "Papayas are grown naturally to support digestion and provide rich vitamins for health.",deliveryTime: "20-30 Min"),
            .init(id: 11, title: .kiwi, image: "kiwi", price: "$2.78 each", color: "6",
                  desc: "Kiwis are cultivated organically, offering tangy sweetness packed with vitamin C.",deliveryTime: "35-40 Min"),
            .init(id: 12, title: .lemon, image: "lemon", price: "$2.04 each", color: "1",
                  desc: "Lemons are grown chemical-free to provide fresh zest and natural health benefits.",deliveryTime: "15-20 Min"),
            .init(id: 13, title: .blackberry, image: "blackberry", price: "$2.04 each", color: "2",
                  desc: "Blackberries are nurtured organically, rich in antioxidants and bold flavor.",deliveryTime: "35-40 Min"),
            .init(id: 14, title: .mango, image: "mango", price: "1.00 each", color: "3",
                  desc: "Mangoes are naturally cultivated, delivering tropical sweetness and vital nutrients.",deliveryTime: "20-30 Min"),
            .init(id: 15, title: .muskmelon, image: "muskmelon", price: "$1.56 each", color: "4",
                  desc: "Muskmelons are grown organically, offering refreshing sweetness and hydration.",deliveryTime: "15-20 Min"),
            .init(id: 16, title: .pear, image: "pear", price: "$2.04 each", color: "5",
                  desc: "Pears are organically produced to provide gentle sweetness and essential fiber.",deliveryTime: "10-15 Min"),
            .init(id: 17, title: .pineapple, image: "pineapple", price: "$2.84 each", color: "6",
                  desc: "Pineapples are cultivated naturally, offering tropical flavor and immune support.",deliveryTime: "10-15 Min"),
            .init(id: 18, title: .plum, image: "plum", price: "$1.15 each", color: "1",
                  desc: "Plums are organically grown to provide juicy sweetness and natural antioxidants.",deliveryTime: "55-60 Min"),
            .init(id: 19, title: .strawbery, image: "strawbery", price: "$2.35 each", color: "2",
                  desc: "Strawberries are cultivated chemical-free, delivering fresh sweetness and vitamin C.",deliveryTime: "55-60 Min"),
            .init(id: 20, title: .watermelon, image: "watermelon", price: "$1.64 each", color: "3",
                  desc: "Watermelons are grown organically, offering juicy refreshment and natural hydration.",deliveryTime: "55-60 Min")
        ]

    
   
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 20){
                ForEach(fruitsArray, id: \.id){ fruitData in
                    NavigationLink(destination: FruitDetailView(fruit: fruitData)){
                        FruitcardView(fruits: fruitData)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    }
                }
            }
        }
    }
}

#Preview {
    TopSellingView()
}
