import SwiftUI

private enum EditorAppearance: String, CaseIterable, Identifiable {
    case light
    case dark

    var id: Self { self }

    var title: String { rawValue.capitalized }

    var colorScheme: ColorScheme {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

struct ContentView: View {
    @State private var text = ""
    @State private var appearance: EditorAppearance = .light

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 8) {
                ForEach(EditorAppearance.allCases) { option in
                    Button(option.title) {
                        appearance = option
                    }
                    .buttonStyle(.borderedProminent)
                }
            }

            TextEditor(text: $text)
        }
        .padding(16)
        .preferredColorScheme(appearance.colorScheme)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}
