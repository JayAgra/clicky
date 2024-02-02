//
//  clickyApp.swift
//  clicky
//
//  Created by Jayen Agrawal on 2/1/24.
//

import SwiftUI

@main
struct clickyApp: App {
    let settingsManager = SettingsManager.shared
    var darkMode: Bool = UserDefaults.standard.bool(forKey: "darkMode")
    
    var body: some Scene {
        WindowGroup {
            TabBar()
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
}
