import SwiftUI

struct MainTabView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            AboutView()
                .tabItem {
                    Label("About", systemImage: "person.text.rectangle")
                }
                .tag(1)
            
            ProjectsView()
                .tabItem {
                    Label("Projects", systemImage: "square.grid.2x2.fill")
                }
                .tag(2)
            
            BlogView()
                .tabItem {
                    Label("Blog", systemImage: "newspaper.fill")
                }
                .tag(3)
            
            ContactView()
                .tabItem {
                    Label("Contact", systemImage: "envelope.fill")
                }
                .tag(4)
        }
    }
}
