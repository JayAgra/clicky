//
//  LevelTwoSwitch.swift
//  clicky
//
//  Created by Jayen Agrawal on 2/1/24.
//

import Foundation
import SwiftUI

struct LevelTwoSwitch: View {
    @StateObject var controller: LevelTwoController
    var row: Int
    var col: Int
    
    var body: some View {
        Toggle("", isOn: Binding(get: {controller.stateBools[(row * 6) + col]}, set: {
            controller.stateBools[(row * 6) + col] = $0
            controller.buttonClicked()
        }))
            .toggleStyle(SwitchToggleStyle(tint: Color.pink))
    }
}
