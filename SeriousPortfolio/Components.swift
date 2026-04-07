import SwiftUI

// MARK: - Reusable UI Components

/// A premium, elegant section header mimicking editorial websites
struct SectionHeader: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(Theme.fontHeading)
                .foregroundColor(Theme.textPrimary)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 10)
    }
}

/// A primary button with Serious Eats orange
struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            action()
        }) {
            Text(title)
                .font(Theme.fontSubheading)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Theme.brandPrimary)
                .cornerRadius(12)
                .shadow(color: Theme.brandPrimary.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

/// A generic card layout common in magazine aesthetics
struct MagazineCard: View {
    let title: String
    let subtitle: String
    let imageName: String
    let metaText: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                Rectangle()
                    .fill(Theme.surface)
                    .aspectRatio(4/3, contentMode: .fit)
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                    .foregroundColor(Theme.brandPrimary.opacity(0.8))
            }
            .cornerRadius(12)
            .clipped()
            
            VStack(alignment: .leading, spacing: 4) {
                if let meta = metaText {
                    Text(meta.uppercased())
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Theme.brandPrimary)
                }
                
                Text(title)
                    .font(Theme.fontSubheading)
                    .foregroundColor(Theme.textPrimary)
                    .lineLimit(2)
                
                Text(subtitle)
                    .font(Theme.fontBody)
                    .foregroundColor(Theme.textSecondary)
                    .lineLimit(3)
            }
            .padding(.horizontal, 4)
        }
    }
}
