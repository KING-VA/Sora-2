//
//  ContentView.swift
//  Sora
//
//  Created by Francesco on 07/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            LibraryView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Library")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    ContentView()
}
