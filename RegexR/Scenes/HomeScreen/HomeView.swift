import SwiftUI

struct HomeView: View {
    // MARK: States & Models
    @ObservedObject var viewModel: HomeViewModel
    
    // MARK: Body
    var body: some View {
        ZStack {
            VStack(spacing: 20) { // Increase spacing for better separation
                regexLabel
                regexField
                    .padding()
                    .background(Color.accentTwo) // Light gray for light mode, darker for dark mode
                    .cornerRadius(8)
                    .shadow(radius: 1) // Subtle shadow for depth
                
                stringListLabel
                stringListField
                    .padding()
                    .frame(height: 150) // Fixed height for better control
                    .background(Color.accentTwo)
                    .cornerRadius(8)
                    .shadow(radius: 1)

                matchedStringsListLabel
                matchedStringsListField
                
                checkButton
            
            }
            .padding()
            .background(Color.backgroundColor) // Adapt to dark and light mode
            .cornerRadius(10)
            .shadow(radius: 2) // Subtle shadow for the entire stack
            
            VStack {
                            Spacer() // Pushes everything below to the bottom

                            bottomPanel // Add the bottom panel here
                        }
        }
        .background(Color.backgroundColor.ignoresSafeArea(edges: .all)) // Apply background to ZStack correctly
        .padding(.horizontal) // Give some breathing room on the sides
        //.offset(y: -100)
    }
    
    // MARK: Components
    private var background: some View {
        Color.backgroundColor.ignoresSafeArea(edges: .all)
    }
    
    private var regexLabel: some View {
        Text("Regular Expression")
            .font(.headline) // Make the label text slightly larger
            .foregroundColor(.primary) // Ensure it adapts to dark and light mode
    }
    
    private var regexField: some View {
        TextField("Insert your regex", text: $viewModel.regex)
            .textFieldStyle(RoundedBorderTextFieldStyle()) // iOS default rounded style
    }
    
    private var stringListLabel: some View {
        Text("String List")
            .font(.headline) // Correct label text and style
            .foregroundColor(.primary)
    }
    
    private var stringListField: some View {
        TextEditor(text: $viewModel.stringList)
            .overlay(
                RoundedRectangle(cornerRadius: 8) // Add border to TextEditor
                    .stroke(Color.secondary, lineWidth: 1)
            )
    }
    
    private var matchedStringsListLabel: some View {
        Text("Matches")
            .font(.headline) // Correct label text and style
            .foregroundColor(.primary)
    }
    
    private var matchedStringsListField: some View {
        // Concatenate the matched strings into a single newline-separated string
        let matchesText = viewModel.matchedStrings.joined(separator: "\n")
        
        return TextEditor(text: .constant(matchesText)) // Use a constant binding if the text is not meant to be edited
            .padding()
            .frame(height: 150) // Adjust height as necessary
            .background(Color.accentTwo)
            .cornerRadius(8)
            .shadow(radius: 1)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary, lineWidth: 1)
            )
    }
    
    private var checkButton: some View {
        Button("Check") {
            Task {
                viewModel.checkMatches()
            }
        }
        .buttonStyle(PrimaryButtonStyle())
    }
    
    private var bottomPanel: some View {
            HStack {
                Button(action: {
                    // Action for About button
                }) {
                    Image(systemName: "info.circle")
                }

                Spacer()

                Button(action: {
                    // Action for Profile button
                }) {
                    Image(systemName: "person.crop.circle")
                }

                Spacer()

                Button(action: {
                    // Action for Settings button
                }) {
                    Image(systemName: "gear")
                }
            }
            .padding() // Add padding for better touch targets and aesthetics
            .background(Color.accentTwo) // Use a background color that adapts to dark and light mode
            .cornerRadius(10) // Optional: round the corners
            .shadow(radius: 2) // Optional: add a shadow for some depth
            .padding(.horizontal) // Match the horizontal padding of the overall layout
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
