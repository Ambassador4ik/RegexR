import SwiftUI


struct LoginView: View {
    // MARK: States & Models
    @ObservedObject var viewModel: LoginViewModel
    
    // MARK: Body
    var body: some View {
        ZStack {
            background
            VStack(spacing: 10) {
                titleText
                usernameField
                passwordField
                loginButton
                errorText
            }
            .padding(25)
            .background(Color.backgroundColor)
            .cornerRadius(10)
        }
        .dismissKeyboardOnTapGesture()
    }
    
    // MARK: - Components
    private var background: some View {
        Color.backgroundColor.ignoresSafeArea(edges: .all)
    }
    
    private var titleText: some View {
        Text("RegexR")
            .foregroundColor(.accentTwo)
            .font(.system(size: 40, weight: .medium))
            .padding(10)
    }
    
    private var usernameField: some View {
        TextField("Username", text: $viewModel.username)
            .textFieldStyle()
    }
    
    private var passwordField: some View {
        SecureField("Password", text: $viewModel.password)
            .textFieldStyle()
    }
    
    private var loginButton: some View {
        Button("Log In") {
            Task {
                await viewModel.login()
            }
        }
        .buttonStyle(LoginButtonStyle())
    }
    
    private var errorText: some View {
        Text(viewModel.errorMessage)
            .foregroundColor(.red)
            .font(.system(size: 14, weight: .regular))
    }
}

// MARK: - Custom Styles
private extension View {
    func textFieldStyle() -> some View {
        self
            .frame(maxWidth: .infinity, idealHeight: 30).padding()
            
            .foregroundColor(.accentTwo)
            .background(Color.backgroundColor).cornerRadius(15)
        
            .font(.system(size: 18, weight: .medium))
            .multilineTextAlignment(.center)
            
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.accentTwo, lineWidth: 3))
    }
}

private struct LoginButtonStyle: ButtonStyle {
    var backgroundColor: Color = .black
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, idealHeight: 30).padding()
        
            .foregroundColor(.white)
            .background(Color.accentTwo).cornerRadius(15)
            
            .font(.system(size: 18, weight: .medium))
        
            .padding(.top, 10)
    }
}
