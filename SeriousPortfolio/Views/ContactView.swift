import SwiftUI

struct ContactView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var isSubmitting = false
    @State private var showSuccess = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Get in Touch")
                        .font(Theme.fontHero)
                        .foregroundColor(Theme.textPrimary)
                        .padding(.top, 20)
                    
                    Text("Whether it's a new project, a job opportunity, or just a technical discussion over coffee, my inbox is always open.")
                        .font(Theme.fontBody)
                        .foregroundColor(Theme.textSecondary)
                        .lineSpacing(6)
                    
                    VStack(spacing: 20) {
                        CustomTextField(placeholder: "Name", text: $name)
                        CustomTextField(placeholder: "Email", text: $email)
                        
                        ZStack(alignment: .topLeading) {
                            if message.isEmpty {
                                Text("Message")
                                    .foregroundColor(Theme.textSecondary.opacity(0.8))
                                    .padding(.horizontal, 16)
                                    .padding(.top, 16)
                            }
                            
                            TextEditor(text: $message)
                                .frame(minHeight: 150)
                                .padding(8)
                                .background(Theme.surface.opacity(0.5))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Theme.surface, lineWidth: 1)
                                )
                        }
                    }
                    .padding(.top, 16)
                    
                    PrimaryButton(title: isSubmitting ? "Sending..." : "Send Message") {
                        submitForm()
                    }
                    .disabled(name.isEmpty || email.isEmpty || message.isEmpty || isSubmitting)
                    .opacity((name.isEmpty || email.isEmpty || message.isEmpty) ? 0.6 : 1.0)
                    .padding(.top, 20)
                    
                    Spacer(minLength: 40)
                }
                .padding(.horizontal)
            }
            .background(Theme.backgroundLight.ignoresSafeArea())
            .alert("Message Sent!", isPresented: $showSuccess) {
                Button("OK", role: .cancel) {
                    name = ""
                    email = ""
                    message = ""
                }
            } message: {
                Text("Thanks for reaching out! I'll get back to you shortly.")
            }
        }
    }
    
    private func submitForm() {
        isSubmitting = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isSubmitting = false
            showSuccess = true
            
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }
}

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Theme.surface.opacity(0.5))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Theme.surface, lineWidth: 1)
            )
            .font(Theme.fontBody)
    }
}

#Preview {
    ContactView()
}
