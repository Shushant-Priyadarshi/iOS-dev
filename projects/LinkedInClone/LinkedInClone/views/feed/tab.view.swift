//
//  tab.view.swift
//  LinkedInClone
//
//  Created by Shushant  on 12/08/25.
//

import SwiftUI

struct TabScreen: View {
    var body: some View {
        TabView{
            FeedView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            NetworkView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Network")
                }
            Text("Post")
                .tabItem {
                    Image(systemName: "plus.app.fill")
                    Text("Post")
                }
            Text("Notifications")
                .tabItem {
                    Image(systemName: "bell.badge.fill")
                    Text("Notifications")
                }
            Text("Jobs")
                .tabItem {
                    Image(systemName: "briefcase.fill")
                    Text("Jobs")
                }
        }
    }
}

#Preview {
    TabScreen()
}
