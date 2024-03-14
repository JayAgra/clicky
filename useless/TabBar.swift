//
//  TabBar.swift
//  useless
//
//  Created by Jayen Agrawal on 1/31/24.
//

import SwiftUI

struct TabBar: View {
    enum Tab {
        case level1, level2, settings
    }
    @State private var selectedTab: Tab? = .level1
    @State public var gameCenter: Bool

    var body: some View {
        TabView(selection: $selectedTab) {
            LevelOneView(gameCenterOk: gameCenter)
                .tabItem {
                    Label("easy", systemImage: "switch.2")
                }
                .tag(Tab.level1)
            LevelTwoView(gameCenterOk: gameCenter)
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
    TabBar(gameCenter: false)
}
