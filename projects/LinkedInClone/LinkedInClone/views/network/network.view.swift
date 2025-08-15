//
//  network.view.swift
//  LinkedInClone
//
//  Created by Shushant  on 12/08/25.
//

import SwiftUI


var networkData: [NetworkModel] = [
    .init(id: 0, name: "Marry", position: "SDE at Paytm", mutualConnections: 34, image: "00"),
    .init(id: 1, name: "Peter", position: "Assistant Manager", mutualConnections: 45, image: "01"),
    .init(id: 2, name: "Jenny", position: "SDE at Ginger ", mutualConnections: 67, image: "02"),
    .init(id: 3, name: "Sara", position: "open to work", mutualConnections: 103, image: "03"),
    .init(id: 4, name: "Kia", position: "GET at HCL", mutualConnections: 12, image: "04"),
    .init(id: 5, name: "Shristi", position: "Student", mutualConnections: 78, image: "05"),
    .init(id: 6, name: "Rachel", position: "intern at iNeuron", mutualConnections: 90, image: "00"),
    .init(id: 7, name: "John", position: "HR at Intel", mutualConnections: 34, image: "01"),
    .init(id: 8, name: "Tiya", position: "purchase Engineer", mutualConnections: 50, image: "02"),
    .init(id: 9, name: "Pheobe", position: "Product Manager", mutualConnections: 86, image: "03"),
    .init(id: 10, name: "Monica", position: "Data Analyst", mutualConnections: 55, image: "04"),
    .init(id: 11, name: "Joe", position: "Software Development intern", mutualConnections: 42, image: "05"),
    .init(id: 12, name: "Charel", position: "SDE-II ", mutualConnections: 30, image: "00"),
    .init(id: 13, name: "Chandler", position: "Mobile Developer", mutualConnections: 71, image: "01"),
    .init(id: 14, name: "Max", position: "QA", mutualConnections: 95, image: "02"),
    .init(id: 15, name: "Nancy", position: "Frontend Developer", mutualConnections: 18, image: "03")

]


struct NetworkView: View {
    var body: some View {
        VStack{
            SearchBarView()
            
            HStack(alignment: .center){
                Text("Manage your network")
                    .foregroundStyle(.blue)
                    .font(.body)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }.padding(.horizontal)
            Rectangle()
                .fill(.gray.opacity(0.4))
                .frame(width: .infinity, height: 10)
                
            HStack{
                Text("Invitations")
                    .foregroundStyle(.blue)
                    .font(.body)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }.padding(.horizontal)
            
            Divider()
            
            ScrollView(.vertical,showsIndicators: false){
                ForEach(networkData, id:\.id){ data in
                    ConnectionCard(Data: data)
                    Divider()
                }
            }
        }
    }
}

#Preview {
    NetworkView()
}
