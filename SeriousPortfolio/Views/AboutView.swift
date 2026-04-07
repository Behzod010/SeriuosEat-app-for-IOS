import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Portrait / Identity
                    ZStack {
                        Circle()
                            .fill(Theme.surface)
                            .frame(width: 150, height: 150)
                            
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                            .foregroundColor(Theme.textSecondary.opacity(0.5))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 40)
                    
                    // Bio setup mapping back to Serious Eats vibe
                    Text("The Methodology")
                        .font(Theme.fontHeading)
                        .foregroundColor(Theme.textPrimary)
                        
                    Text("Just like a perfectly engineered recipe, great software requires precise measurements, an understanding of the underlying science, and an appreciation for the end user's experience. With over **12 years of experience** in mobile engineering, I specialize in bringing that level of craftsmanship to iOS.")
                        .font(Theme.fontBody)
                        .foregroundColor(Theme.textSecondary)
                        .lineSpacing(6)
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // Resume / Skills snippet
                    Text("Core Ingredients")
                        .font(Theme.fontHeading)
                        .foregroundColor(Theme.textPrimary)
                    
                    VStack(spacing: 16) {
                        SkillRow(title: "Languages", value: "Swift, Objective-C, Python")
                        SkillRow(title: "Frameworks", value: "SwiftUI, UIKit, Combine")
                        SkillRow(title: "Architecture", value: "MVVM, Clean, TCA")
                        SkillRow(title: "Performance", value: "Instruments, Core Data")
                    }
                    
                    Spacer(minLength: 40)
                }
                .padding(.horizontal)
            }
            .background(Theme.backgroundLight.ignoresSafeArea())
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SkillRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Theme.textPrimary)
                .frame(width: 100, alignment: .leading)
            
            Text(value)
                .font(Theme.fontBody)
                .foregroundColor(Theme.textSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    AboutView()
}
