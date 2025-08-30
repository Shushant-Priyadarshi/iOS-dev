//
//  ListView.swift
//  todoApp
//
//  Created by Shushant  on 30/08/25.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listviewmodel: ListViewModel
    
    var body: some View {
        ZStack{
            if listviewmodel.listOfTasks.isEmpty{
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listviewmodel.listOfTasks){ task in
                        TaskRowView(task: task)
                            .onTapGesture{
                                withAnimation(.smooth){
                                    listviewmodel.update(task: task)
                                }
                            }
                    }
                    .onDelete(perform: listviewmodel.deleteTasks)
                    .onMove(perform: listviewmodel.moveTasks)
                }
            }
        }
        .navigationTitle("Your Todos")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add",destination: AddView()))
        
    }
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
}
