//
//  AddView.swift
//  todoApp
//
//  Created by Shushant  on 29/08/25.
//

import SwiftUI

struct AddView: View {
    
    //dismiss a view
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listviewmodel: ListViewModel
    
    @State var textfieldvalue:String = ""
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("shopping...", text: $textfieldvalue)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                Button(action: saveButtonTapped, label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                      
                      
                       
                })
            }
            .padding(16)
        }.navigationTitle("Add Your Todos")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonTapped(){
        if isTextValid(){
            listviewmodel.addTask(taskName: textfieldvalue)
            presentationMode.wrappedValue.dismiss()
        }
    }
        
    func isTextValid() -> Bool {
        if textfieldvalue.count == 0 {
            alertTitle = "Please add some todo!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
   
}
