//
//  UiLoops.swift
//  Revising_Swift
//
//  Created by Shushant  on 22/10/25.
//

import SwiftUI

struct UiLoops: View {
    
    let fruits = ["Apple", "Banana","Kiwi","DragonFruit"]
    var body: some View {
        VStack(alignment: .leading){
            
            ForEach(fruits, id: \.self) { fruit in
                HStack(){
                    VStack(alignment:.leading){
                        Text(fruit)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                }
                .padding(5)
                .border(.black)
            }
            
        }
        .padding(34)
        

        
        ScrollView(.horizontal){
            HStack{
                ForEach(1..<11 , id: \.self){index in
                        Rectangle()
                        .frame(width: 100,height: 100)
                        .overlay(
                            Text("\(index)")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        )
                }

            }
        }
        .padding(32)
    }
}

#Preview {
    UiLoops()
}
