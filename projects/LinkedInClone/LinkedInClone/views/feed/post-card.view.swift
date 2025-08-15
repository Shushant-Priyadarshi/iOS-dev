//
//  post-card.view.swift
//  LinkedInClone
//
//  Created by Shushant  on 12/08/25.
//

import SwiftUI

struct SocialView{
    var ids:Int
    var image:String
    var title:String
}

var socialView: [SocialView] = [
    .init(ids: 0, image: "hand.thumbsup", title: "Like"),
    .init(ids: 1, image: "text.bubble", title: "Comment"),
    .init(ids: 2, image: "arrow.turn.up.right", title: "Share"),
    //.init(ids: 3, image: "paperplane.fill", title: "Send")
]


let samplePostData = PostModel(id: 2, image: "15", title: "Shushant", followers: 2435, profileImage: "03")

struct PostCardView: View {
    var Data: PostModel
    var body: some View {
        VStack(alignment:.leading){
            Rectangle()
                .fill(.gray.opacity(0.4))
                .frame(width: .infinity, height: 10)
            
            HStack(alignment: .center){
                Image(Data.profileImage)
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70,height: 70,alignment: .leading)
                
                VStack(alignment: .leading){
                    Text(Data.title)
                        .font(.body)
                    Text("\(Data.followers) followers")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Text("8 min")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Image(systemName: "ellipsis")
                
            }.padding(.horizontal)
            
            Text("If you are a tier 69 student, here's how you can crack FAANG: \n 1) take my DSA course \n 2)Join Ganndu Academy \n- ex BHANGBHOSDA").padding(.horizontal)
            Image(Data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity, height: .infinity, alignment: .center)
            Divider()
            
            HStack(alignment: .center,spacing: 70){
                ForEach(socialView,id:\.ids){social in
                    HStack(spacing: 10){
                        Image(systemName: social.image)
                        Text(social.title)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black.opacity(0.8))
                }
            }.padding(.horizontal)
        }
    }
  
       
}

#Preview {
    PostCardView(Data: samplePostData)
}
