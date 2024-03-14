//
//  LevelTwoController.swift
//  useless
//
//  Created by Jayen Agrawal on 2/1/24.
//

import Foundation
import UIKit

class LevelTwoController: ObservableObject {
    @Published public var showSheet: Bool = false
    @Published public var stateBools: [Bool] = ((UserDefaults.standard.array(forKey: "levelTwo") ?? [Array(repeating: false, count: 24)]) as? [Bool] ?? Array(repeating: false, count: 24))
    public var levelTwoSwitches: Array<LevelTwoSwitch> = []
    private var isUpdatingSwitches: Bool = false
    
    init() {
        for i in 0...23 {
            levelTwoSwitches.append(LevelTwoSwitch(controller: self, row: (i / 6), col: i % 6))
        }
        let saved = ((UserDefaults.standard.array(forKey: "levelTwo") ?? [Array(repeating: false, count: 24)]) as? [Bool] ?? Array(repeating: false, count: 24));
        for index in 0...23 {
            stateBools[index] = saved[index]
        }
    }

    public func buttonClicked() {
        guard !isUpdatingSwitches else { return }
        isUpdatingSwitches = true
        
        let random: Int = Int.random(in: 0...4)
        for _ in 0...random {
            stateBools[Int.random(in: 0...23)] = Bool.random()
        }

        UserDefaults.standard.set(stateBools, forKey: "levelTwo")
        UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "levelTwoCount") + 1, forKey: "levelTwoCount")
        checkBoard()
    }
    
    func checkBoard() {
        if !stateBools.contains(false) {
            if UserDefaults.standard.integer(forKey: "levelTwoCount") < UserDefaults.standard.integer(forKey: "levelTwoBest") {
                UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "levelTwoCount"), forKey: "levelTwoBest")
            }
            self.showSheet = true
        } else {
            isUpdatingSwitches = false
        }
    }
}
