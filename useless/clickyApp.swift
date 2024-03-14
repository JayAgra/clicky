//
//  uselessApp.swift
//  useless
//
//  Created by Jayen Agrawal on 2/1/24.
//

import SwiftUI
import GameKit

@main
struct clickyApp: App {
    let settingsManager = SettingsManager.shared
    var darkMode: Bool = UserDefaults.standard.bool(forKey: "darkMode")
    @State public var gameCenterOk: Bool
    
    init() {
        self.gameCenterOk = true
        self.gameCenter()
    }
    
    var body: some Scene {
        WindowGroup {
            TabBar(gameCenter: gameCenterOk)
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
    
    func gameCenter() {
        GKLocalPlayer.local.authenticateHandler = { viewController, error in
            if error != nil {
                gameCenterOk = false
            }
            
            gameCenterOk = true
        }
    }
}
