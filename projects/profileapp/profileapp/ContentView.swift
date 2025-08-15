//
//  ContentView.swift
//  profileapp
//
//  Created by Shushant  on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                Spacer()
                VStack(alignment:.center, spacing: 20){
                    Image("myImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180, alignment: .top)
                        .clipShape(Circle())
                        .shadow(color: .pink, radius:5  ,x: 5,y:5)
                    Text("Shushant Priyadarshi")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.system(.largeTitle))
                        .shadow(radius: 5)
                    Text("iOS | Full Stack Developer")
                        .foregroundColor(.white)
                        .font(.body)
                    HStack(alignment: .center, spacing: 30){
                        Image(systemName: "heart.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(systemName: "network")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(systemName: "message.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(systemName: "phone.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 250, height: 40, alignment: .center)
                    .shadow(color: .pink, radius:5 ,y:8)
                    .foregroundColor(.white)
                    
                }
                Spacer()
                VStack(alignment: .center, spacing: 30){
                    RoundedRectangle(cornerRadius: 120)
                        .frame(width: 200, height: 50,alignment: .center)
                        .foregroundColor(.white)
                        .shadow(color: .pink, radius: 5 ,y:5)
                        .overlay(
                            Text("Follow")
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                                .font(.system(size: 30))
                        )
                    HStack(alignment: .center, spacing: 60){
                        VStack{
                            Text("222")
                                .font(.title)
                                .foregroundColor(.pink)
                            Text("Appreciations")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        VStack{
                            Text("222")
                                .font(.title)
                                .foregroundColor(.pink)
                            Text("Appreciations")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        VStack{
                            Text("222")
                                .font(.title)
                                .foregroundColor(.pink)
                            Text("Appreciations")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    Text("About Me")
                        .font(.largeTitle)
                    Text("I am a fullstack developer. Welcome to my profile. Please consider following me!")
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .opacity(0.7)
                }.padding()
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
