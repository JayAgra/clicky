//
//  TabBar.swift
//  clicky
//
//  Created by Jayen Agrawal on 1/31/24.
//

import SwiftUI

struct TabBar: View {
    enum Tab {
        case level1, level2, settings
    }
    @State private var selectedTab: Tab? = .level1

    var body: some View {
        TabView(selection: $selectedTab) {
            LevelOneView()
                .tabItem {
                    Label("easy", systemImage: "switch.2")
                }
                .tag(Tab.level1)
            LevelTwoView()
                .tabItem {
                    Label("hard", systemImage: "switch.2")
                }
                .tag(Tab.level2)
            SettingsView()
                .tabItem {
                    Label("settings", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
    }
}

#Preview {
    TabBar()
}
