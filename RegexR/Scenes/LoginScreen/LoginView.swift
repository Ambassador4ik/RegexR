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
            .padding()
            .background(Color.backgroundColor)
            .cornerRadius(10)
        }
    }
    
    // MARK: - Components
    private var background: some View {
        Color.backgroundColor.ignoresSafeArea(edges: .all)
    }
    
    private var titleText: some View {
        Text("RegexR")
            .font(.largeTitle)
            .foregroundColor(Color.accentTwo)
            .padding()
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
        Button("Login") {
            Task {
                await viewModel.login()
            }
        }
        .buttonStyle(PrimaryButtonStyle())
    }
    
    private var errorText: some View {
        Text(viewModel.errorMessage)
            .font(.callout)
    }
}

// MARK: - Custom Styles
private extension View {
    func textFieldStyle() -> some View {
        self
            .padding()
            .background(Color.backgroundColor)
            .cornerRadius(5.0)
    }
}

private struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(5.0)
    }
}
