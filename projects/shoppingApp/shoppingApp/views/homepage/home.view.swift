//
//  ContentView.swift
//  shoppingApp
//
//  Created by Shushant  on 11/08/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10){
                
                HStack{
                    Image(systemName: "line.3.horizontal")
                    Spacer()
                    Image(systemName: "cart.badge.plus")
                }
                .font(.title2)
                
                Text("Hey!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Find fresh fruits you want")
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.gray.opacity(0.3))
                    .overlay(
                        HStack(alignment: .firstTextBaseline){
                            Image(systemName: "magnifyingglass")
                            Text("Search fresh fruits")
                                .foregroundStyle(.gray)
                            Spacer()
                        }.padding(.horizontal)
                    )
                    .frame(width: 350, height: 50)
                
                Text("Top Selling")
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y:30)
                TopSellingView()
                
                Text("Near You")
                    .font(.title)
                    .fontWeight(.bold)
                NearYouView()
                Spacer()
            }.padding()
            
//                .navigationBarTitle("")
//                .navigationBarBackButtonHidden(true)
//                .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
