//
//  fruit-detail.view.swift
//  shoppingApp
//
//  Created by Shushant  on 11/08/25.
//

import SwiftUI

struct RoundedCornerShape:Shape{
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Counter:View{
    @State var counter = 0
    
    var body: some View {
        
        HStack(spacing:25){
            
            Button {
                if(counter != 0){
                    counter -= 1
                }
                
            } label: {
                Image(systemName: "minus")
            }
            
            Text("\(counter)")
                .font(.title)
            
            Button {
                if(counter != 10){
                    counter += 1
                }
                
            } label: {
                Image(systemName: "plus")
            }
            
            
            
            
        }
        .foregroundStyle(.black)
        .frame(width: 130, height: 50)
        .background(Color("bgColor").opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
    }
}


struct FruitDetailView: View {

    var fruit: FruitModel
    var body: some View {
        VStack(alignment: .leading, spacing: 25){
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .clipShape(RoundedCornerShape.init(corners: [.bottomLeft,.bottomRight], radius: 50))
                .frame(width: .infinity, height: .infinity, alignment: .top)
                .edgesIgnoringSafeArea(.all)
                .shadow(color: .gray, radius: 7, x: 0, y: 5)
                .overlay(
                    Image(fruit.title.rawValue)
                        .resizable()
                        .frame(width: 250, height: 250, alignment: .center)
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                )
            Spacer()
            Text("\(fruit.title.rawValue) - Medium")
                .fontWeight(.medium)
                .font(.title)
                .padding(.horizontal)
                .textCase(.uppercase)
            
            Text("\(fruit.desc)")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .lineLimit(6)
                .padding(.horizontal)
            
            HStack{
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("bgColor").opacity(0.15))
                    .overlay(Image(systemName: "hourglass"))
                    .font(.system(size: 40))
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 7){
                    Text("Delivery Time")
                    Text("\(fruit.deliveryTime)")
                }
            }.padding(.horizontal)
            
            HStack{
                Text("\(fruit.price)")
                    .fontWeight(.medium)
                    .font(.title)
                    .padding(.horizontal)
                Spacer()
                Counter()
                
            }
            
            Image("bg")
                .resizable()
                .frame(width: 350, height: 50, alignment: .center)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x:5, y:5)
                .overlay(
                    Text("Add to Cart")
                        .fontWeight(.medium)
                        .font(.title3)
                )
                .padding(.horizontal)
        }
    }
}

