//
//  Basics.swift
//  Revising_Swift
//
//  Created by Shushant  on 21/10/25.
//

import SwiftUI

struct Basics: View {
    
    @State var textColor = Color.blue
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100,height: 100)
                .foregroundStyle(textColor)
            
            Text("Hello, world!")
                .font(.system(size:32, weight: .semibold, design: .rounded))
                .strikethrough()
                .foregroundStyle(textColor)
            
            Circle()
                .stroke(.red, lineWidth: 5)
                .frame(width: 50, height: 50)
            
            Rectangle()
                .fill(LinearGradient(colors: [.blue,.brown], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 150, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            Spacer()
            
            Text("Hello")
                .font(.title)
                .fontWeight(.bold)
                .padding([.bottom,.trailing], 32)
                .foregroundStyle(textColor)
            
    
            Button {
                if(textColor == .red){
                    textColor = .blue
                }else{
                    textColor = .red
                }
            } label: {
                Text("Click to change Color")
                    .frame(width: 240, height: 70)
                    .background(.purple)
                    .foregroundStyle(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            }

         
        }
        .padding()
    }
}



#Preview {
    Basics()
}
