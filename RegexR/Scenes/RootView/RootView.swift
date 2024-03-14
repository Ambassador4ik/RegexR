import SwiftUI

struct RootView: View {
    @State private var isSignupViewPresented = false
    @State private var isLoginViewPresented = false
    
    @StateObject private var authManager = AuthManager()

    var body: some View {
        // Authenticated: show home screen
        if (authManager.isAuthenticated) {
            HomeConfigurator.configure()
        } 
        // Not authenticated: show start menu
        else {
            NavigationStack {
                ZStack {
                    background
                    
                    VStack {
                        Spacer()
                        title
                        
                        Spacer()
                        loginButton
                        signupButton
                    }
                    .padding([.leading, .trailing], 30)
                }
                .padding(.bottom, 5)
                
                // MARK: Navigation Destinations
                .navigationDestination(isPresented: $isLoginViewPresented) {
                    LoginConfigurator.configure()
                }
                .navigationDestination(isPresented: $isSignupViewPresented) {
                    SignupConfigurator.configure()
                }
            }
        }
    }
    
    // MARK: Components
    private var background: some View {
        Color.backgroundColor.edgesIgnoringSafeArea(.all)
    }
    
    private var title: some View {
        Text("RegexR")
            .foregroundColor(.accentTwo)
            .font(.system(size: 40, weight: .medium))
    }
    
    private var loginButton: some View {
        Button("Log In") {
            withAnimation {
                isLoginViewPresented.toggle()
            }
        }
        .buttonStyle(LoginButtonStyle())
    }
    
    private var signupButton: some View {
        Button("Sign Up") {
            withAnimation {
                isSignupViewPresented.toggle()
            }
        }
        .buttonStyle(SignupButtonStyle())
    }
}


private struct LoginButtonStyle: ButtonStyle {
    var backgroundColor: Color = .black
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, idealHeight: 30).padding()
            
            .foregroundColor(.accentTwo)
            .background(Color.backgroundColor).cornerRadius(15)
        
            .font(.system(size: 18, weight: .medium))
            
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.accentTwo, lineWidth: 3))
    }
}


private struct SignupButtonStyle: ButtonStyle {
    var backgroundColor: Color = .black
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, idealHeight: 30).padding()
        
            .foregroundColor(.white)
            .background(Color.accentTwo).cornerRadius(15)
            
            .font(.system(size: 18, weight: .medium))
        
            .padding(.top, 5)
    }
}
