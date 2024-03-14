import SwiftUI

struct RootView: View {
    @State private var isRegistrationViewPresented = false
    @State private var isLoginViewPresented = false
    
    @StateObject private var authManager = AuthManager()

    var body: some View {
        if (authManager.isAuthenticated) {
            
        } else {
            NavigationStack {
                ZStack {
                    Color.backgroundColor.edgesIgnoringSafeArea(.all)
                    VStack {

                        Spacer()

                        // Login button
                        Button("Login") {
                            withAnimation {
                                isLoginViewPresented.toggle()
                            }
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: .gray))

                        // Sign up button
                        Button("Sign up") {
                            withAnimation {
                                isRegistrationViewPresented.toggle()
                            }
                        }
                        .buttonStyle(CustomButtonStyle(backgroundColor: Color.accentOne))
                        .padding()
                    }
                }
                // Conditional navigation destinations
                .navigationDestination(isPresented: $isLoginViewPresented) {
                    LoginConfigurator.configure()
                }
                .navigationDestination(isPresented: $isRegistrationViewPresented) {
                    SignupConfigurator.configure()
                }
            }
        }
    }
}

// Custom button style for consistency
struct CustomButtonStyle: ButtonStyle {
    var backgroundColor: Color = .black
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
