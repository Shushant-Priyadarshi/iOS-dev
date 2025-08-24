//
//  PhaseAnimation.swift
//  animations
//
//  Created by Shushant  on 24/08/25.
//

import SwiftUI

struct PhaseAnimation: View {
    var body: some View {
        HStack (spacing:20){
            Button("Notify Me"){
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
            .fontWeight(.semibold)
            .controlSize(.large)
   
        
        Image(systemName: "bell")
            .resizable()
            .frame(width: 44, height: 44)
            .foregroundColor(.pink)
            
        }
        .padding()
    }
}

#Preview {
    PhaseAnimation()
}
