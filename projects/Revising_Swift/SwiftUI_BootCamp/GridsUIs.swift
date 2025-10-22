//
//  GridsUIs.swift
//  Revising_Swift
//
//  Created by Shushant  on 22/10/25.
//

import SwiftUI

struct GridsUIs: View {
    
    let gridThingy = [GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible()),
    ]
    
    
    var body: some View {
        GeometryReader{ geo in
            let screenWidth = geo.size.width / 3
            LazyVGrid(columns: gridThingy,spacing: 0){
                ForEach(0..<15, id: \.self){index in
                        RoundedRectangle(cornerRadius: 10)
                        .frame(width:screenWidth , height: 150)
                        .border(.white)
                }
            }
            .padding(.horizontal,2)
        }
       
    }
}

#Preview {
    GridsUIs()
}
