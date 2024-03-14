//
//  LevelOneSwitch.swift
//  useless
//
//  Created by Jayen Agrawal on 2/1/24.
//

import Foundation
import SwiftUI

struct LevelOneSwitch: View {
    @StateObject var controller: LevelOneController
    var row: Int
    var col: Int
    
    var body: some View {
        Toggle("", isOn: Binding(get: {controller.stateBools[(row * 4) + col]}, set: {
            controller.stateBools[(row * 4) + col] = $0
            controller.buttonClicked()
        }))
            .toggleStyle(SwitchToggleStyle(tint: Color.blue))
    }
}
