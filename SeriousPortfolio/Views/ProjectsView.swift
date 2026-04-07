import SwiftUI

struct ProjectsView: View {
    let projects = MockDataStore.shared.projects
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(projects) { project in
                        NavigationLink(destination: Text("Detail View: \(project.title)")) {
                            VStack(alignment: .leading, spacing: 8) {
                                ZStack {
                                    Rectangle()
                                        .fill(Theme.surface)
                                        .aspectRatio(1, contentMode: .fit)
                                        .cornerRadius(10)
                                    
                                    Image(systemName: project.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(30)
                                        .foregroundColor(Theme.brandPrimary)
                                }
                                
                                Text(project.category.uppercased())
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Theme.textSecondary)
                                    .padding(.top, 4)
                                
                                Text(project.title)
                                    .font(Theme.fontSubheading)
                                    .foregroundColor(Theme.textPrimary)
                                    .lineLimit(2)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .simultaneousGesture(TapGesture().onEnded {
                            UIImpactFeedbackGenerator(style: .selection).selectionChanged()
                        })
                    }
                }
                .padding()
            }
            .background(Theme.backgroundLight.ignoresSafeArea())
            .navigationTitle("Portfolio")
        }
    }
}

#Preview {
    ProjectsView()
}
