//
//  StateProperties.swift
//  Revising_Swift
//
//  Created by Shushant  on 22/10/25.
//

import SwiftUI

struct StateProperties: View {
    
    @State var counter = 0
    
   @State var likes = 0
    @State var likedImage = "heart"
    @State var likedColor = Color.black
    
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    if(counter <= 0){
                        return
                    }
                    counter  = counter - 1
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 50,height: 50)
                        .background(.blue)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                Text("\(counter)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                
                Button {
                    counter  = counter + 1
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 50,height: 50)
                        .background(.blue)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }

            }
        }
        
        Divider()
        
        VStack{
            
            HStack{
                
                
                Image("profileImg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
                
                Text("harkirat")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                
            }
            
            Image("meme")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipped()
            
            HStack{
                
                Button {
                    likes += 1
                    likedImage = "heart.fill"
                    likedColor = .red
                } label: {
                    Image(systemName: likedImage)
                        .font(.title3)
                        .foregroundStyle(likedColor)
                }

                
                
                Image(systemName: "bubble.right")
                    .font(.title3)
                
                Image(systemName: "paperplane")
                    .font(.title3)
                
                Spacer()
                
            }

            
            HStack{
                Text("\(likes) likes")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding([.top,.leading],6)
           
            
        
                
        }
        
    }
}

#Preview {
    StateProperties()
}
