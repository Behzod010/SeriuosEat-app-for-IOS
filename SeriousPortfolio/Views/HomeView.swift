import SwiftUI

struct HomeView: View {
    @State private var isRefreshing = false
    let projects = MockDataStore.shared.projects
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // MARK: - Hero Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Exploring the Science\nOf Great Code.")
                            .font(Theme.fontHero)
                            .foregroundColor(Theme.textPrimary)
                            .padding(.top, 40)
                        
                        Text("Welcome to my digital kitchen. I dissect modern iOS architecture and build premium, fluid experiences.")
                            .font(Theme.fontBody)
                            .foregroundColor(Theme.textSecondary)
                            .lineSpacing(6)
                        
                        Divider()
                            .padding(.vertical, 16)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Featured Content
                    SectionHeader(title: "Featured Project")
                    
                    if let featured = projects.first {
                        NavigationLink(destination: Text("Project Detail: \(featured.title)")) {
                            MagazineCard(
                                title: featured.title,
                                subtitle: featured.description,
                                imageName: featured.imageName,
                                metaText: featured.category
                            )
                            .padding(.horizontal)
                            .padding(.bottom, 24)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .simultaneousGesture(TapGesture().onEnded {
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        })
                    }
                    
                    // MARK: - Latest from the Blog
                    SectionHeader(title: "Latest Thoughts")
                    
                    VStack(spacing: 20) {
                        ForEach(MockDataStore.shared.blogPosts.prefix(2)) { post in
                            HStack(alignment: .top, spacing: 16) {
                                Image(systemName: post.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .padding(10)
                                    .background(Theme.surface)
                                    .cornerRadius(8)
                                    .foregroundColor(Theme.brandPrimary)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(post.title)
                                        .font(Theme.fontSubheading)
                                        .foregroundColor(Theme.textPrimary)
                                        .lineLimit(2)
                                    
                                    Text("\(post.date) • \(post.readTime)")
                                        .font(Theme.fontCaption)
                                        .foregroundColor(Theme.textSecondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
            .refreshable {
                // Simulate network refresh
                await Task.sleep(2_000_000_000)
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            }
            .background(Theme.backgroundLight.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("SERIOUS DEVELOPER")
                        .font(.system(size: 16, weight: .black, design: .serif))
                        .tracking(2)
                        .foregroundColor(Theme.brandPrimary)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
