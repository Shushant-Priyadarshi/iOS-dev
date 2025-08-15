//
//  key.view.swift
//  calculator
//
//  Created by Shushant  on 10/08/25.
//

import SwiftUI

struct KeyView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State private var changeColor = false
    
    let buttons:[[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero , .decimal, .equal]
        
    ]
    var body: some View {
        VStack{
            
 
        Spacer()
        
        HStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 350, height: 250)
                .foregroundColor(changeColor ?
                                 Color("number").opacity(0.4):
                                 Color.pink.opacity(0.2))
                .scaleEffect(changeColor ? 1.5 : 1.0)
                .animation(Animation
                    .easeInOut
                    .speed(0.17)
                    .repeatForever(), value: changeColor)
                .onAppear(){
                    self.changeColor.toggle()
                }
                .overlay(
                    Text(value)
                    .font(.system(size: 100))
                    .bold()
                )
        }.padding()
        
        Spacer()
        //buttons
        ForEach(buttons, id: \.self){ row in
            HStack(spacing:10){
                ForEach(row, id: \.self){ elem in
                    Button {
                        didTap(button: elem)
                    } label: {
                        Text(elem.rawValue)
                            .font(.system(size: 30))
                            .frame(width:self.getWidth(elem: elem), height: self.getHeight(elem: elem))
                            .background(elem.buttonColor)
                            .cornerRadius(self.getWidth(elem: elem)/2)
                            .foregroundColor(.black)
                            .shadow(color: .purple.opacity(0.8), radius: 30,)
                        
                    }

                }
            }.padding(.bottom, 4)
        }
        }
        
        
    }
    
    func getWidth(elem: Keys) -> CGFloat {
        if(elem == .zero){
            return (UIScreen.main.bounds.width - (5*10)) / 2
        }
        return (UIScreen.main.bounds.width - (5*10)) / 4
    }
    
    func getHeight(elem: Keys) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*10)) / 5
    }
    
    func didTap(button : Keys){
        print("Tapped")
    }
}

#Preview {
    KeyView()
}
