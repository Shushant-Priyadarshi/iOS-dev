//
//  search-bar.view.swift
//  LinkedInClone
//
//  Created by Shushant  on 12/08/25.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack(alignment:.center,spacing: 20){
            Image("demo")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 50,height: 50)
            
            RoundedRectangle(cornerRadius: 8)
                .fill(.blue.opacity(0.15))
                .frame(width: 270, height: 30)
                .overlay(
                    HStack(spacing: 10){
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.black)
                            .fontWeight(.medium)
                        Text("Search")
                            .font(.title3)
                            .foregroundStyle(.black)
                            .opacity(0.7)
                        Spacer()
                    }.padding(.horizontal)
                )
            
            Image(systemName: "ellipses.bubble.fill")
                .resizable()
                .foregroundStyle(.gray)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            
        }.padding(.top)
    }
}

#Preview {
    SearchBarView()
}
