//
//// BeautifulSwiftUIApp.swift
//// A single-file beautiful multi-screen SwiftUI app using only hardcoded data.
//// Drop this into a new SwiftUI Xcode project (replace the default ContentView.swift and App file) and run.
//
//import SwiftUI
//
//// MARK: - Models
//struct Feature: Identifiable {
//    let id = UUID()
//    let title: String
//    let subtitle: String
//    let color1: Color
//    let color2: Color
//    let symbol: String
//    let details: String
//}
//
//struct UserProfile {
//    let name: String
//    let email: String
//    let bio: String
//}
//
//// MARK: - Sample Data
//let sampleFeatures: [Feature] = [
//    Feature(title: "Focus Sessions",
//            subtitle: "Deep work, timed sessions",
//            color1: .purple,
//            color2: .blue,
//            symbol: "bolt.fill",
//            details: "Start a timed focus session with calm ambient tones and subtle animations that keep you in flow."),
//    Feature(title: "Daily Mood",
//            subtitle: "Quick emotional check-in",
//            color1: .pink,
//            color2: .orange,
//            symbol: "face.smiling.fill",
//            details: "Track how you feel each day with one-tap emojis and a warm streak visualiser."),
//    Feature(title: "Inspiration",
//            subtitle: "Hand-picked micro-reads",
//            color1: .green,
//            color2: .mint,
//            symbol: "sparkles",
//            details: "Read a short inspiring thought daily to lift your energy."),
//    Feature(title: "Mini Tasks",
//            subtitle: "Small wins that scale",
//            color1: .indigo,
//            color2: .teal,
//            symbol: "checkmark.seal.fill",
//            details: "Capture 3 tiny tasks and celebrate completion with a playful confetti animation."),
//]
//
//let sampleUser = UserProfile(name: "Aarav Sharma",
//                             email: "aarav@example.com",
//                             bio: "Designer & Learner • Loves mountains, code & chai ☕️")
//
//// MARK: - App Entry
////@main
//struct BeautifulSwiftUIApp: App {
//    var body: some Scene {
//        WindowGroup {
//            RootView()
//                .preferredColorScheme(.dark)
//        }
//    }
//}
//
//// MARK: - Root / Navigation
//struct RootView: View {
//    @State private var showOnboarding = false
//    var body: some View {
//        NavigationView {
//            HomeView()
//                .navigationBarHidden(true)
//        }
//        .sheet(isPresented: $showOnboarding, content: {
//            OnboardingView()
//        })
//        .onAppear {
//            // reveal onboarding only first time in this demo
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
//                showOnboarding = true
//            }
//        }
//    }
//}
//
//// MARK: - Home View
//struct HomeView: View {
//    @State private var search = ""
//    @Namespace private var namespace
//    @State private var selectedFeature: Feature?
//    @State private var showProfile = false
//
//    var body: some View {
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color("BG1", bundle: nil), Color(.systemGray6).opacity(0.06)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
//
//            ScrollView(showsIndicators: false) {
//                VStack(spacing: 22) {
//                    topBar
//
//                    greetingCard
//
//                    searchBar
//
//                    featuresGrid
//
//                    Spacer(minLength: 40)
//                }
//                .padding()
//            }
//
//            // Floating + button
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    NavigationLink(destination: CreateTaskView()) {
//                        FloatingButton()
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.bottom, 20)
//            }
//        }
//        .fullScreenCover(item: $selectedFeature) { feature in
//            FeatureDetailView(feature: feature)
//        }
//        .sheet(isPresented: $showProfile) {
//            ProfileView(user: sampleUser)
//        }
//    }
//
//    // MARK: Subviews
//    var topBar: some View {
//        HStack {
//            VStack(alignment: .leading) {
//                Text("Good Evening")
//                    .font(.subheadline)
//                    .foregroundStyle(.secondary)
//                Text("Aarav 🔆")
//                    .font(.largeTitle.bold())
//                    .lineLimit(1)
//            }
//            Spacer()
//            Button(action: { showProfile.toggle() }) {
//                Image(systemName: "person.crop.circle.fill")
//                    .resizable()
//                    .frame(width: 44, height: 44)
//                    .symbolRenderingMode(.palette)
//                    .foregroundStyle(.white, .gray)
//                    .background(Circle().fill(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 52, height: 52))
//            }
//        }
//    }
//
//    var greetingCard: some View {
//        ZStack(alignment: .leading) {
//            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.95), Color.blue.opacity(0.85)]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 6)
//
//            HStack {
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("Create flow that lasts")
//                        .font(.title2.bold())
//                    Text("30 minute focus session starts in 10 minutes. Ready?")
//                        .font(.subheadline)
//                        .foregroundStyle(.white.opacity(0.9))
//                }
//                Spacer()
//                ZStack {
//                    Circle()
//                        .strokeBorder(.white.opacity(0.12), lineWidth: 18)
//                        .frame(width: 88, height: 88)
//                    Circle()
//                        .trim(from: 0, to: 0.65)
//                        .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
//                        .rotationEffect(.degrees(-90))
//                        .frame(width: 66, height: 66)
//                        .foregroundStyle(.white)
//                    Image(systemName: "play.fill")
//                        .font(.title2)
//                        .foregroundColor(.white)
//                }
//            }
//            .padding(20)
//        }
//        .frame(height: 140)
//    }
//
//    var searchBar: some View {
//        HStack(spacing: 12) {
//            HStack {
//                Image(systemName: "magnifyingglass")
//                TextField("Search features", text: $search)
//            }
//            .padding(12)
//            .background(.ultraThinMaterial)
//            .cornerRadius(12)
//
//            Button(action: {}) {
//                Image(systemName: "bell.fill")
//                    .padding(12)
//                    .background(.ultraThinMaterial)
//                    .cornerRadius(12)
//            }
//        }
//    }
//
//    var featuresGrid: some View {
//        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
//            ForEach(sampleFeatures) { feature in
//                Button(action: { withAnimation(.spring()) { selectedFeature = feature } }) {
//                    FeatureCard(feature: feature)
//                }
//            }
//        }
//    }
//}
//
//// MARK: - Feature Card
//struct FeatureCard: View {
//    var feature: Feature
//
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            RoundedRectangle(cornerRadius: 18, style: .continuous)
//                .fill(LinearGradient(colors: [feature.color1, feature.color2], startPoint: .topLeading, endPoint: .bottomTrailing))
//                .frame(height: 160)
//                .shadow(color: feature.color1.opacity(0.3), radius: 8, x: 0, y: 6)
//
//            VStack(alignment: .leading, spacing: 10) {
//                Label {
//                    Text(feature.title)
//                        .font(.headline.bold())
//                        .foregroundColor(.white)
//                } icon: {
//                    Image(systemName: feature.symbol)
//                        .font(.title2)
//                        .foregroundColor(.white.opacity(0.95))
//                }
//
//                Text(feature.subtitle)
//                    .font(.subheadline)
//                    .foregroundColor(.white.opacity(0.9))
//
//                Spacer()
//
//                HStack {
//                    Spacer()
//                    Circle()
//                        .fill(Color.white.opacity(0.12))
//                        .frame(width: 44, height: 44)
//                        .overlay(Image(systemName: "chevron.right") .foregroundColor(.white.opacity(0.9)))
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//// MARK: - Feature Detail
//struct FeatureDetailView: View {
//    var feature: Feature
//    @Environment(\.dismiss) var dismiss
//    @State private var animate = false
//
//    var body: some View {
//        ZStack {
//            LinearGradient(colors: [feature.color1, feature.color2], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
//
//            VStack(spacing: 20) {
//                HStack {
//                    Button(action: { dismiss() }) {
//                        Image(systemName: "chevron.left")
//                            .padding(10)
//                            .background(.ultraThinMaterial)
//                            .cornerRadius(10)
//                    }
//                    Spacer()
//                }
//                .padding()
//
//                Spacer()
//                Image(systemName: feature.symbol)
//                    .font(.system(size: 78))
//                    .opacity(0.95)
//                    .scaleEffect(animate ? 1.05 : 0.9)
//                    .rotationEffect(.degrees(animate ? 2 : -2))
//                    .onAppear { withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) { animate.toggle() } }
//
//                Text(feature.title)
//                    .font(.largeTitle.bold())
//                    .foregroundColor(.white)
//
//                Text(feature.details)
//                    .font(.body)
//                    .foregroundColor(.white.opacity(0.95))
//                    .padding(.horizontal)
//                    .multilineTextAlignment(.center)
//
//                Spacer()
//
//                HStack(spacing: 16) {
//                    Button(action: {}) {
//                        Label("Start", systemImage: "play.fill")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(.ultraThinMaterial)
//                            .cornerRadius(14)
//                    }
//
//                    Button(action: {}) {
//                        Label("Remind me", systemImage: "bell")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(.white.opacity(0.12))
//                            .cornerRadius(14)
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.bottom, 30)
//            }
//        }
//    }
//}
//
//// MARK: - Floating Button
//struct FloatingButton: View {
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 16)
//                .fill(LinearGradient(colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
//                .frame(width: 72, height: 72)
//                .shadow(radius: 8)
//            Image(systemName: "plus")
//                .font(.title2.bold())
//                .foregroundColor(.white)
//        }
//    }
//}
//
//// MARK: - Create Task View
//struct CreateTaskView: View {
//    @Environment(\.presentationMode) var presentation
//    @State private var title = ""
//    @State private var note = ""
//
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 18) {
//                TextField("Task title", text: $title)
//                    .textFieldStyle(.roundedBorder)
//                    .padding(.horizontal)
//
//                TextEditor(text: $note)
//                    .frame(height: 160)
//                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.12)))
//                    .padding(.horizontal)
//
//                Spacer()
//
//                Button(action: { presentation.wrappedValue.dismiss() }) {
//                    Text("Save")
//                        .font(.headline)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
//                        .cornerRadius(12)
//                        .padding(.horizontal)
//                }
//                .padding(.bottom)
//            }
//            .navigationTitle("New Mini Task")
//            .toolbar { ToolbarItem(placement: .cancellationAction) { Button("Close") { presentation.wrappedValue.dismiss() } } }
//        }
//    }
//}
//
//// MARK: - Profile View
//struct ProfileView: View {
//    var user: UserProfile
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 20) {
//                ZStack {
//                    Circle()
//                        .fill(LinearGradient(colors: [.orange, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .frame(width: 110, height: 110)
//                        .shadow(radius: 12)
//                    Text(user.name.prefix(1))
//                        .font(.largeTitle.bold())
//                        .foregroundColor(.white)
//                }
//
//                Text(user.name)
//                    .font(.title2.bold())
//                Text(user.bio)
//                    .foregroundColor(.secondary)
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal)
//
//                Divider()
//
//                VStack(spacing: 12) {
//                    HStack {
//                        Label("Email", systemImage: "envelope.fill")
//                        Spacer()
//                        Text(user.email)
//                            .foregroundColor(.secondary)
//                    }
//                    HStack {
//                        Label("Member since", systemImage: "calendar")
//                        Spacer()
//                        Text("Jan 15, 2024")
//                            .foregroundColor(.secondary)
//                    }
//                }
//                .padding(.horizontal)
//
//                Spacer()
//
//                Button(action: { dismiss() }) {
//                    Text("Done")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(.ultraThinMaterial)
//                        .cornerRadius(12)
//                        .padding(.horizontal)
//                }
//                .padding(.bottom)
//            }
//            .padding()
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//// MARK: - Onboarding
//struct OnboardingView: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var page = 0
//    let pages = [
//        (title: "Welcome to Luma", subtitle: "Calm design, small wins, big progress."),
//        (title: "Focus Sessions", subtitle: "Timed periods to build momentum."),
//        (title: "Daily Mood", subtitle: "One-tap check-ins to know yourself."),
//    ]
//
//    var body: some View {
//        TabView(selection: $page) {
//            ForEach(0..<pages.count, id: \.self) { idx in
//                VStack(spacing: 18) {
//                    Spacer()
//                    Image(systemName: idx == 0 ? "sparkles" : (idx == 1 ? "timer" : "face.smiling"))
//                        .font(.system(size: 72))
//                        .padding(30)
//                        .background(Circle().fill(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)))
//                        .foregroundColor(.white)
//
//                    Text(pages[idx].title)
//                        .font(.largeTitle.bold())
//
//                    Text(pages[idx].subtitle)
//                        .foregroundColor(.secondary)
//                        .multilineTextAlignment(.center)
//                        .padding(.horizontal)
//
//                    Spacer()
//                }
//                .tag(idx)
//            }
//        }
//        .tabViewStyle(.page(indexDisplayMode: .always))
//        .overlay(alignment: .topTrailing) {
//            Button("Skip") { dismiss() }
//                .padding()
//        }
//        .overlay(alignment: .bottom) {
//            Button(action: { if page < pages.count - 1 { page += 1 } else { dismiss() } }) {
//                Text(page < pages.count - 1 ? "Next" : "Get Started")
//                    .bold()
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(LinearGradient(colors: [.pink, .purple], startPoint: .leading, endPoint: .trailing))
//                    .cornerRadius(14)
//                    .padding()
//            }
//        }
//    }
//}
//
//
//// MARK: - Preview
//struct BeautifulSwiftUIApp_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//            .previewDevice("iPhone 14")
//    }
//}
