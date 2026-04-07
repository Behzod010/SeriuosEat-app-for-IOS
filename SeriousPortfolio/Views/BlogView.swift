import SwiftUI

struct BlogView: View {
    let posts = MockDataStore.shared.blogPosts
    
    var body: some View {
        NavigationStack {
            List(posts) { post in
                NavigationLink(destination: Text("Article: \(post.title)")) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(post.title)
                            .font(Theme.fontHeading)
                            .foregroundColor(Theme.textPrimary)
                            .padding(.top, 8)
                        
                        Text(post.summary)
                            .font(Theme.fontBody)
                            .foregroundColor(Theme.textSecondary)
                            .lineLimit(3)
                        
                        HStack {
                            Text(post.date)
                            Spacer()
                            Text(post.readTime)
                        }
                        .font(Theme.fontCaption)
                        .foregroundColor(Theme.brandPrimary)
                        .padding(.top, 4)
                        .padding(.bottom, 8)
                    }
                }
                .listRowSeparatorTint(Theme.surface)
                .listRowBackground(Theme.background)
            }
            .listStyle(PlainListStyle())
            .refreshable {
                await Task.sleep(1_000_000_000)
            }
            .background(Theme.backgroundLight.ignoresSafeArea())
            .navigationTitle("Articles")
        }
    }
}

#Preview {
    BlogView()
}
