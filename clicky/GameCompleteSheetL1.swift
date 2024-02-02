//
//  GameCompleteSheetL1.swift
//  clicky
//
//  Created by Jayen Agrawal on 2/1/24.
//

import SwiftUI

struct GameCompleteSheetL1: View {
    @ObservedObject public var controller: LevelOneController
    @Environment(\.dismiss) private var dismiss
    private var localSwitches: LevelOneController = LevelOneController()
    
    init(controller: LevelOneController) {
        self.controller = controller
        localSwitches.stateBools = Array(repeating: true, count: 16)
    }
    
    var body: some View {
        VStack {
            Text("level 1 complete")
                .font(.title)
                .padding()
            LazyHGrid(rows: [GridItem()]) {
                ForEach(0...3, id: \.self) { row in
                    VStack {
                        ForEach(0...3, id: \.self) { col in
                            localSwitches.levelOneSwitches[(4 * row) + col]
                                .disabled(true)
                        }
                    }
                    .padding([.top, .bottom])
                }
            }
            .padding()
            Text("changed states \(UserDefaults.standard.integer(forKey: "levelOneCount")) times (best: \(UserDefaults.standard.integer(forKey: "levelOneBest")))")
            Button("reset") {
                for index in 0...15 {
                    controller.stateBools[index] = false
                }
                UserDefaults.standard.set(Array(repeating: false, count: 16), forKey: "levelOne")
                UserDefaults.standard.set(0, forKey: "levelOneCount")
                dismiss()
            }
            .padding()
        }
        .padding()
        .onAppear() {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }
}

#Preview {
    GameCompleteSheetL1(controller: LevelOneController())
}
