import Foundation

// MARK: - Models

struct Project: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: String
    let imageName: String
    let techStack: [String]
}

struct BlogPost: Identifiable {
    let id = UUID()
    let title: String
    let summary: String
    let date: String
    let readTime: String
    let imageName: String
}

// MARK: - Mock Data Store

final class MockDataStore {
    static let shared = MockDataStore()
    private init() {}
    
    let projects: [Project] = [
        Project(
            title: "Culinary Physics Engine",
            description: "A specialized app using ARKit to simulate heat transfer in various pans, visually mirroring Serious Eats' deep dives into culinary science.",
            category: "iOS / ARKit",
            imageName: "flame.fill",
            techStack: ["Swift", "ARKit", "Metal"]
        ),
        Project(
            title: "Recipe Master API",
            description: "A robust backend service for storing and querying complex recipe relationships and nutritional data with sub-millisecond response times.",
            category: "Backend",
            imageName: "server.rack",
            techStack: ["Node.js", "PostgreSQL", "Redis"]
        ),
        Project(
            title: "Crispy UI Kit",
            description: "An open-source SwiftUI design system providing perfect, snap-to-grid layouts, inspired by magazine-style editorial websites.",
            category: "Open Source",
            imageName: "paintpalette.fill",
            techStack: ["SwiftUI", "Documentation"]
        ),
        Project(
            title: "The Ultimate Guide to Soups",
            description: "An interactive iPad experience featuring 100+ soup recipes in a fluid, immersive interface with step-by-step video integrations.",
            category: "iPadOS",
            imageName: "drop.fill",
            techStack: ["Swift", "AVFoundation"]
        )
    ]
    
    let blogPosts: [BlogPost] = [
        BlogPost(
            title: "The Science of the Perfect iOS Architecture",
            summary: "Why blindly following Clean Architecture isn't always the best approach, and how to find the perfect blend for your specific project.",
            date: "Oct 12, 2023",
            readTime: "8 min read",
            imageName: "book.pages"
        ),
        BlogPost(
            title: "SwiftUI Performance Optimization Deep Dive",
            summary: "We tested 50 different list implementations to find out exactly why your scroll view is stuttering. Here are the results.",
            date: "Sep 28, 2023",
            readTime: "12 min read",
            imageName: "gauge.with.dots.needle.bottom.50percent"
        ),
        BlogPost(
            title: "Building Editorial Layouts in SwiftUI",
            summary: "Translating magazine-style web layouts into fluid, accessible, and beautiful native iOS views using modern grids.",
            date: "Sep 05, 2023",
            readTime: "6 min read",
            imageName: "newspaper.fill"
        )
    ]
}
