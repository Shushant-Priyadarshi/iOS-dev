//
//  onBoardingScreen.swift
//  shoppingApp
//
//  Created by Shushant  on 11/08/25.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        NavigationView{
            VStack(spacing:30){
                Spacer()
                Image("img")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .padding()
                VStack(alignment: .leading,spacing: 10){
                    Text("Order Your Favourite Fruits")
                        .font(.system(.largeTitle))
                        .fontWeight(.bold)
                    Text("Eat fresh fruits and try to be healthy")
                        .font(.system(.title3))
                        .foregroundColor(.black.opacity(0.7))
                }
                Spacer()
                NavigationLink(destination: HomeView()) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("6"))
                        .frame(width: 280, height: 60 , alignment: .trailing)
                        .overlay(
                            HStack(spacing:10){
                                Text("Next")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Image(systemName: "chevron.right")
                            }.foregroundColor(.black)
                        )
                }
                Spacer()
                
            }

            
        }
    }
}


#Preview {
    OnBoardingView()
}
