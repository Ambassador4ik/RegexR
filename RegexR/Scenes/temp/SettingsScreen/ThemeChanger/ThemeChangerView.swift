import SwiftUI

struct ThemeChangerView: View {
    var scheme: ColorScheme
    
    @AppStorage("userTheme") private var userTheme: ThemeChangerModels.Theme = .systemDefault
    
    var body: some View {
        VStack {
            ForEach(ThemeChangerModels.Theme.allCases, id: \.rawValue) { theme in
                HStack {
                    Button {
                        userTheme = theme
                    } label: {
                        Text(theme.rawValue)
                        Spacer()
                        
                        if (theme == userTheme) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding(.vertical, 1)
                .padding(.horizontal)
            }
        }
        .cornerRadius(5)
        .padding(.vertical)
        // sync env and local schemes
        .environment(\.colorScheme, scheme)
    }
}

struct ThemeChangerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeChangerView(scheme: .light)
    }
}

