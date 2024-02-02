//
//  GameCompleteSheetL2.swift
//  clicky
//
//  Created by Jayen Agrawal on 2/1/24.
//

import SwiftUI

struct GameCompleteSheetL2: View {
    @ObservedObject public var controller: LevelTwoController
    @Environment(\.dismiss) private var dismiss
    private var localSwitches = LevelTwoController()
    
    init(controller: LevelTwoController) {
        self.controller = controller
        localSwitches.stateBools = Array(repeating: true, count: 24)
    }
    
    var body: some View {
        VStack {
            Text("level 2 complete")
                .font(.title)
                .padding(.bottom)
            LazyHGrid(rows: [GridItem()]) {
                ForEach(0...3, id: \.self) { row in
                    VStack {
                        ForEach(0...5, id: \.self) { col in
                            localSwitches.levelTwoSwitches[(4 * row) + col]
                                .disabled(true)
                        }
                    }
                    .padding([.top, .bottom])
                }
                .padding([.top, .bottom])
            }
            .padding()
            Text("changed states \(UserDefaults.standard.integer(forKey: "levelTwoCount")) times (best: \(UserDefaults.standard.integer(forKey: "levelTwoBest")))")
                .padding(.top)
            Button("reset") {
                for index in 0...23 {
                    controller.stateBools[index] = false
                }
                UserDefaults.standard.set(Array(repeating: false, count: 24), forKey: "levelTwo")
                UserDefaults.standard.set(0, forKey: "levelTwoCount")
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
    GameCompleteSheetL2(controller: LevelTwoController())
}
