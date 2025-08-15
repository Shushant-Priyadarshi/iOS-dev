//
//  connection-card.swift
//  LinkedInClone
//
//  Created by Shushant  on 12/08/25.
//

import SwiftUI

let sampleData = NetworkModel(id: 1, name: "Rahul Singh", position:  "SDE at Google", mutualConnections: 54, image: "01")



struct ConnectionCard: View {
    var Data:NetworkModel
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 10){
            Image(Data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea(.all)
                .clipShape(Circle())
                .frame(width: 70,height: 70)
            
            VStack(alignment: .leading){
                Text(Data.name)
                    .font(.body)
                Text(Data.position)
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                Text("⚭ \(Data.mutualConnections) Mutual Connections")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }.frame(width: 150,height: 20,alignment: .leading)
            
            HStack{
                Image(systemName: "multiply.circle")
                    .font(.system(size: 35))
                    .foregroundColor(.gray)
                Image(systemName: "checkmark.circle")
                    .font(.system(size: 35))
                    .foregroundColor(.blue).opacity(0.8)
            }.padding(.horizontal)
        }
        .frame(width: .infinity, height: .infinity)
        .padding(.horizontal)
    }
}

#Preview {
    ConnectionCard(Data: sampleData)
}
