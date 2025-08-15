//
//  feed.view.swift
//  LinkedInClone
//
//  Created by Shushant  on 12/08/25.
//

import SwiftUI


struct FeedView: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 20){
            SearchBarView()
            FeedPostsView()
            
        }
    }
}

#Preview {
    FeedView()
}
