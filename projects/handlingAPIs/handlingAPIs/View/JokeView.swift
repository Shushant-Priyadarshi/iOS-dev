//
//  JokeView.swift
//  handlingAPIs
//
//  Created by Shushant  on 31/08/25.
//

import SwiftUI

struct JokeView: View {
    
    
    @State  private var jokeDataFromInternet:JokeModel? = nil
    @State private var isLoading:Bool = false
 
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                           .imageScale(.large)
                           .foregroundStyle(.tint)
            
            if isLoading{
                ProgressView("Fetching a Random Joke...")
            }else if let joke = jokeDataFromInternet{
                Text(joke.data.content)
                    .font(.headline)
                    .padding()
            }else{
                Text("Press the button to fetch a random joke")
            }
            
            Button(action: {
                Task{
                    await fetchRandomJoke()
                }
            }, label: {
                Text("Fetch Joke")
                    .buttonStyle(.bordered)
            })
        }
        .padding()
    }
    
    func fetchRandomJoke() async {
            guard let url = URL(string: "https://api.freeapi.app/api/v1/public/randomjokes/joke/random") else {
                print("Url does not exist")
                return
            }
        
            isLoading = true
        defer{
            isLoading = false
        }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let decodedResponse = try? JSONDecoder().decode(JokeModel.self, from: data) {
                    jokeDataFromInternet = decodedResponse
                }
            } catch {
                print("Invalid data or failed to fetch request")
            }
        }
    
    
}

#Preview {
    JokeView()
}
