import SwiftUI

// MARK: - Models
struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let description: String
    let category: String
}

// MARK: - Sample Data
let sampleMovies: [Movie] = [
    Movie(title: "Stranger Things", imageName: "poster1", description: "A love letter to the '80s classics that captivated a generation.", category: "Trending Now"),
    Movie(title: "Money Heist", imageName: "poster2", description: "A criminal mastermind who goes by 'The Professor' plans the biggest heist in history.", category: "Trending Now"),
    Movie(title: "Breaking Bad", imageName: "poster3", description: "A high school chemistry teacher turned meth kingpin.", category: "Top Picks"),
    Movie(title: "Wednesday", imageName: "poster4", description: "A sleuthing, supernaturally infused mystery from the Addams Family universe.", category: "Top Picks"),
    Movie(title: "The Witcher", imageName: "poster5", description: "A mutated monster-hunter struggles to find his place in a world.", category: "Watch Again"),
    Movie(title: "The Crown", imageName: "poster6", description: "A drama about the reign of Queen Elizabeth II.", category: "Watch Again")
]

// MARK: - App Entry
@main
struct NetflixCloneApp: App {
    var body: some Scene {
        WindowGroup {
            NetflixHomeView()
                .preferredColorScheme(.dark)
        }
    }
}

// MARK: - Home View
struct NetflixHomeView: View {
    @State private var selectedMovie: Movie?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(Array(Set(sampleMovies.map { $0.category })), id: \.self) { category in
                        CategoryRow(title: category,
                                    movies: sampleMovies.filter { $0.category == category },
                                    onSelect: { movie in
                                        selectedMovie = movie
                                    })
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Netflix")
            .navigationBarTitleDisplayMode(.inline)
        }
        .fullScreenCover(item: $selectedMovie) { movie in
            MovieDetailView(movie: movie)
        }
    }
}

// MARK: - Category Row
struct CategoryRow: View {
    let title: String
    let movies: [Movie]
    let onSelect: (Movie) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2.bold())
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(movies) { movie in
                        Button(action: { onSelect(movie) }) {
                            Image(movie.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 200)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - Movie Detail View
struct MovieDetailView: View {
    var movie: Movie
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ZStack(alignment: .topLeading) {
                    Image(movie.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                    
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.title2.bold())
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                    .padding()
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(movie.title)
                        .font(.largeTitle.bold())
                    
                    Text(movie.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 20) {
                        Button(action: {}) {
                            Label("Play", systemImage: "play.fill")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                        }
                        
                        Button(action: {}) {
                            Label("Download", systemImage: "arrow.down.to.line")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(6)
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
}

// MARK: - Preview
struct NetflixHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NetflixHomeView()
    }
}
