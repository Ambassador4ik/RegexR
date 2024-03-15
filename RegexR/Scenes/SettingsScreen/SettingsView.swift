import SwiftUI

struct SettingsView: View {
    @State private var isSheetVisible: Bool = false
    
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: ThemeChangerModels.Theme = .systemDefault
    
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change theme") {
                        isSheetVisible.toggle()
                    }
                }
                .navigationTitle("Settings")
            }
        }
        // passing currentTheme
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $isSheetVisible, content: {
            ThemeChangerView(scheme: scheme)
                .presentationDetents([.height(100)])
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
