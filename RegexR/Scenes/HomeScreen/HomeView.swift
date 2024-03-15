import SwiftUI

struct HomeView: View {
    // MARK: States & Models
    @ObservedObject var viewModel: HomeViewModel
    
    @State private var isAboutViewPresented = false
    @State private var isSettingsViewPresented = false
    @State private var isProfileViewPresented = false
    
    // MARK: Body
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 20) {
                regexLabel
                regexField
                
                stringListLabel
                stringListField

                matchedStringsListLabel
                matchedStringsListField
                
                checkButton
                
                errorText
                
                Spacer()
                bottomPanel
            }
            .padding()
            .background(Color.backgroundColor)
        }
        .background(Color.backgroundColor.ignoresSafeArea(edges: .all))
        .dismissKeyboardOnTapGesture()
        .padding(.horizontal)
    }
    
    // MARK: Components
    private var background: some View {
        Color.backgroundColor.ignoresSafeArea(edges: .all)
    }
    
    private var regexLabel: some View {
        Text("Regular Expression")
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(.primary) // Ensure it adapts to dark and light mode
            .shadow(radius: 2)
    }
    
    private var regexField: some View {
        TextField("Insert your regex", text: $viewModel.regex)
            .textFieldStyle() // iOS default rounded style
    }
    
    private var stringListLabel: some View {
        Text("String List")
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(.primary)
            .shadow(radius: 2)
    }
    
    private var stringListField: some View {
        TextEditor(text: $viewModel.stringList)
            .textFieldStyle()
    }
    
    private var matchedStringsListLabel: some View {
        Text("Matches")
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(.primary)
            .shadow(radius: 2)
    }
    
    private var matchedStringsListField: some View {
        let matchesText = viewModel.matchedStrings.joined(separator: "\n")
        
        return TextEditor(text: .constant(matchesText))
            .textFieldStyle()
    }
    
    private var checkButton: some View {
        Button("Check") {
            Task {
                viewModel.checkMatches()
            }
        }
        .buttonStyle(PrimaryButtonStyle())
    }
    
    private var errorText: some View {
        Text(viewModel.errorMessage)
            .foregroundColor(.red)
            .font(.system(size: 14, weight: .regular))
    }
    
    private var bottomPanel: some View {
        NavigationStack {
            HStack {
                Button(action: {
                    isAboutViewPresented.toggle()
                }) {
                    Image(systemName: "info.circle")
                        .imageScale(.large)
                        .foregroundColor(Color.accentTwo)
                }
                
                Spacer()
                
                Button(action: {
                    // Action for Profile button
                }) {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                        .foregroundColor(Color.accentTwo)
                }
                
                Spacer()
                
                Button(action: {
                    isSettingsViewPresented.toggle()
                }) {
                    Image(systemName: "gear")
                        .imageScale(.large)
                        .foregroundColor(Color.accentTwo)
                }
            }
            .padding().cornerRadius(10).shadow(radius: 2)
            .frame(maxWidth: .infinity)
            .background(Color.backgroundColor)
            
            .fullScreenCover(isPresented: $isAboutViewPresented) {
                AboutView()
            }
            .fullScreenCover(isPresented: $isSettingsViewPresented) {
                SettingsView(authManager: viewModel.authManager)
            }
        }
    }
    
}

// MARK: - Custom Styles
private extension View {
    func textFieldStyle() -> some View {
        self
            .frame(maxWidth: .infinity, minHeight: 30).padding()
            
            .foregroundColor(.accentTwo)
            .background(Color.backgroundColor).cornerRadius(15)
        
            .font(.system(size: 18, weight: .medium))
            
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.accentTwo, lineWidth: 3))
            .shadow(radius: 2)
    }
}

private struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, idealHeight: 30).padding()
        
            .foregroundColor(Color.backgroundColor)
            .background(Color.accentTwo).cornerRadius(15)
            
            .font(.system(size: 18, weight: .medium))
        
            .padding(.top, 10)
            .shadow(radius: 2)
    }
}
