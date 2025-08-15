//
//  splashscreen.view.swift
//  calculator
//
//  Created by Shushant  on 10/08/25.
//

import SwiftUI

struct SplashscreenView: View {
    
    
    @State private var isActive:Bool = false
    @State private var size = 0.7
    @State private var opacity = 0.4

    var body: some View {
        if(isActive){
            CalculatorView()
        }else{
            VStack {
                Image("mascot")
                Text("Calcu").font(.system(size: 30))
                    .foregroundColor(.black)
                    .bold().opacity(0.7)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.0)){
                    self.size = 1.5
                    self.opacity = 1
                }
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
            
        }
         
    }
}

#Preview {
    SplashscreenView()
}
