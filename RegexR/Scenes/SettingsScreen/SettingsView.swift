import SwiftUI

struct SettingsView: View {
    @State private var isSheetVisible: Bool = false
    @Environment(\.presentationMode) var presentationMode // Add this line

    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: ThemeChangerModels.Theme = .systemDefault
    
    var authManager: AuthManager?
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Appearance")) {
                    Button("Change theme") {
                        isSheetVisible.toggle()
                    }
                    Button("Logout") {
                        authManager?.logout()
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { // Add a leading toolbar item
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.down") // Customize as needed
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $isSheetVisible, content: {
            ThemeChangerView(scheme: scheme)
                .presentationDetents([.height(100)])
        })
    }
}

