//
//  SettingsManager.swift
//  useless
//
//  Created by Jayen Agrawal on 2/1/24.
//

import Foundation

class SettingsManager {
    static let shared = SettingsManager()

    private init() {
        let defaults: [String: Any] = [
            "darkMode": true,
            "levelOne": Array(repeating: false, count: 16),
            "levelTwo": Array(repeating: false, count: 24),
            "levelOneCount": 0,
            "levelTwoCount": 0,
            "levelOneBest": Int.max,
            "levelTwoBest": Int.max
        ]
        UserDefaults.standard.register(defaults: defaults)
    }

    func saveSetting(value: String, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    func getSetting(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
}
