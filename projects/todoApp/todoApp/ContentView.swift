//
//  ContentView.swift
//  todoApp
//
//  Created by Shushant  on 14/08/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("username") var username = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name: ", text: $username)
            
            Text("Hello \(username)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
