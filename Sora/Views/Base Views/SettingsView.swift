//
//  SettingsView.swift
//  Sora
//
//  Created by Francesco on 07/08/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("tmdbLanguage") private var selectedLanguage = "en-US"
    
    let languages = [
        ("en-US", "English (US)"),
        ("en-GB", "English (UK)"),
        ("es-ES", "Spanish (Spain)"),
        ("es-MX", "Spanish (Mexico)"),
        ("fr-FR", "French"),
        ("de-DE", "German"),
        ("it-IT", "Italian"),
        ("pt-BR", "Portuguese (Brazil)"),
        ("ja-JP", "Japanese"),
        ("ko-KR", "Korean"),
        ("zh-CN", "Chinese (Simplified)"),
        ("zh-TW", "Chinese (Traditional)"),
        ("ru-RU", "Russian"),
        ("ar-SA", "Arabic"),
        ("hi-IN", "Hindi"),
        ("th-TH", "Thai"),
        ("tr-TR", "Turkish"),
        ("pl-PL", "Polish"),
        ("nl-NL", "Dutch"),
        ("sv-SE", "Swedish"),
        ("da-DK", "Danish"),
        ("no-NO", "Norwegian"),
        ("fi-FI", "Finnish")
    ]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                settingsContent
            }
        } else {
            NavigationView {
                settingsContent
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    private var settingsContent: some View {
        List {
            Section {
                NavigationLink(destination: LanguageSelectionView(selectedLanguage: $selectedLanguage, languages: languages)) {
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.blue)
                            .frame(width: 24, height: 24)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Informations Language")
                        }
                        
                        Spacer()
                        
                        Text(languages.first { $0.0 == selectedLanguage }?.1 ?? "English (US)")
                            .foregroundColor(.secondary)
                    }
                }
            } header: {
                Text("TMDB Settings")
            } footer: {
                Text("This setting affects the language of movie titles, descriptions, and other content from TMDB.")
            }
            
            Section {
                NavigationLink(destination: ServicesView()) {
                    Text("Services")
                }
                
                NavigationLink(destination: LoggerView()) {
                    Text("Logger")
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct LanguageSelectionView: View {
    @Binding var selectedLanguage: String
    let languages: [(String, String)]
    
    var body: some View {
        List {
            ForEach(languages, id: \.0) { language in
                HStack {
                    Text(language.1)
                    Spacer()
                    if selectedLanguage == language.0 {
                        Image(systemName: "checkmark")
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedLanguage = language.0
                }
            }
        }
        .navigationTitle("Language")
    }
}
