//
//  todoAppApp.swift
//  todoApp
//
//  Created by Shushant  on 14/08/25.
//

import SwiftUI

@main
struct todoAppApp: App {
    
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
