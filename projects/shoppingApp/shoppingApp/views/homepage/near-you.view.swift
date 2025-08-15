//
//  near-you.view.swift
//  shoppingApp
//
//  Created by Shushant  on 11/08/25.
//

import SwiftUI

struct NearYouView: View {
    var body: some View {
        
        let dataArray: [PlaceModel] = [
                .init(id: 0, name: "Food 365 Valley", time: "9:00 - 10:00", rating: "★ 4.7 |📍 1.5 km", image: "1"),
                .init(id: 1, name: "Super Store", time: "8:00 - 10:00", rating: "★ 4.5 |📍 1.7 km", image: "2"),
                .init(id: 2, name: "Organic Farm", time: "6:00 - 11:00", rating: "★ 4.9 |📍 2.0 km", image: "3"),
                .init(id: 3, name: "Big Basket", time: "9:00 - 10:00", rating: "★ 3.7 |📍 2.2 km", image: "4"),
                .init(id: 4, name: "Easy Mart", time: "8:00 - 12:00", rating: "★ 4.7 |📍 2.7 km", image: "5"),
                .init(id: 5, name: "Let's Shop", time: "7:00 - 11:00", rating: "★ 4.0 |📍 3.0 km", image: "6")
            ]
        
        ScrollView(.vertical, showsIndicators: false){
            ForEach(dataArray, id: \.id){ data in
                HStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.gray.opacity(15))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(data.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        )
                    VStack(alignment: .leading){
                        Text("\(data.name)")
                            .font(.system(.headline))
                        Text("\(data.time)")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        Text("\(data.rating)")
                    }
                }
            }
        }
    }
}

#Preview {
    NearYouView()
}
