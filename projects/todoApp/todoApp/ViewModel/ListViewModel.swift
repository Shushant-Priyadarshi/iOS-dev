//
//  ListViewModel.swift
//  todoApp
//
//  Created by Shushant  on 14/08/25.
//

import Foundation

@Observable
class ListViewModel{
    
    var listOfTasks: [TaskModel] = [] {
        didSet{
            saveTasks()
        }
    }
    
    let tasksKey:String = "tasks_list"
    
    init(){
        getTaskItems()
    }
    
    func getTaskItems(){
        guard let data = UserDefaults.standard.data(forKey: tasksKey) else {return} //data will be in json format
        
        //decode it here
        guard let savedData = try? JSONDecoder().decode([TaskModel].self, from: data) else {return}
        
        self.listOfTasks = savedData
    }
    
    func saveTasks(){
        if let encodeData = try? JSONEncoder().encode(listOfTasks){
            UserDefaults.standard.set(encodeData,forKey: tasksKey)
        }
    }
    
}
