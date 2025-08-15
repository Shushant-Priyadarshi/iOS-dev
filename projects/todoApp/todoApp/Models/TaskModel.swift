//
//  ItemModel.swift
//  todoApp
//
//  Created by Shushant  on 14/08/25.
//

import Foundation

struct TaskModel:Identifiable, Codable{
    var id:String
    var taskname:String
    var isCompleted:Bool
    
    init(Id: String = UUID().uuidString, Taskname: String, IsCompleted: Bool) {
        self.id = Id
        self.taskname = Taskname
        self.isCompleted = IsCompleted
    }
    
    func updateCompletion() -> TaskModel {
        return TaskModel(Id: id, Taskname: taskname, IsCompleted: !isCompleted)
    }
}
