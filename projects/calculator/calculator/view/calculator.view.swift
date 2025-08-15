//
//  ContentView.swift
//  calculator
//
//  Created by Shushant  on 09/08/25.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.pink.opacity(0.3), .purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            KeyView()
           
        }
        
        
  
    }
}

#Preview {
    CalculatorView()
}
