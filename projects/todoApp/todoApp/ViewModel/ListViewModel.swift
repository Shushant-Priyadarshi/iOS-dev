//
//  ListViewModel.swift
//  todoApp
//
//  Created by Shushant  on 14/08/25.
//

import Foundation


class ListViewModel: ObservableObject{
    
    @Published var listOfTasks: [TaskModel] = [] {
        didSet{
            saveTasks()
        }
    }
    
    let tasksKey:String = "tasks_list"
    
    init(){
        getTaskItems()
    }
    
    //MARK: - add new task
    func addTask(taskName:String){
        let newTask: TaskModel = TaskModel(Taskname: taskName, IsCompleted: false)
        listOfTasks.append(newTask)
    }
    
    //MARK: - update Completion
    func update(task:TaskModel){
        if let index = listOfTasks.firstIndex(where: {$0.id == task.id}){
            listOfTasks[index] = task.updateCompletion()
        }
    }
    
    //MARK: -   delete task
    func deleteTasks(indexSet:IndexSet){
        listOfTasks.remove(atOffsets: indexSet)
    }
    
    
    //MARK: - move tasks
    func moveTasks(from:IndexSet, to:Int){
        listOfTasks.move(fromOffsets: from, toOffset: to)
    }

   
    //MARK: -   Struct  => JSON and saving it in userDefault
    func saveTasks(){
        if let encodeData = try? JSONEncoder().encode(listOfTasks){
            UserDefaults.standard.set(encodeData,forKey: tasksKey)
        }
    }
    
    
    
    //MARK: -  fetch the itemKey from  userDefault & JSON  => Struct
    func getTaskItems(){
        //fetching the data from user default
        guard let data = UserDefaults.standard.data(forKey: tasksKey) else {
            return
        }
        //decode it here (JSON  => Struct)
        guard let savedData = try? JSONDecoder().decode([TaskModel].self, from: data) else {
            return
        }
        self.listOfTasks = savedData
    }
    
}
