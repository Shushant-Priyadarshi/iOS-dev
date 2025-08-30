//
//  TaskRowView.swift
//  todoApp
//
//  Created by Shushant  on 30/08/25.
//

import SwiftUI

struct TaskRowView: View {
    var task:TaskModel
    
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ?  "checkmark.circle": "circle")
                .foregroundColor(task.isCompleted ? .green : .red)
            Text(task.taskname)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 12)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    var item1 = TaskModel( Taskname: "TASK 1", IsCompleted: true)
    var item2 = TaskModel( Taskname: "TASK 2", IsCompleted: false)
    Group{
        TaskRowView(task: item1)
        TaskRowView(task: item2)
    }
  
}
