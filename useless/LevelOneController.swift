//
//  LevelOneController.swift
//  useless
//
//  Created by Jayen Agrawal on 2/1/24.
//

import Foundation
import UIKit

class LevelOneController: ObservableObject {
    @Published public var showSheet: Bool = false
    @Published public var stateBools: [Bool] = ((UserDefaults.standard.array(forKey: "levelOne") ?? [Array(repeating: false, count: 16)]) as? [Bool] ?? Array(repeating: false, count: 16))
    public var levelOneSwitches: Array<LevelOneSwitch> = []
    private var isUpdatingSwitches: Bool = false
    
    init() {
        for i in 0...15 {
            levelOneSwitches.append(LevelOneSwitch(controller: self, row: i % 4, col: (i / 4)))
        }
        let saved = ((UserDefaults.standard.array(forKey: "levelOne") ?? [Array(repeating: false, count: 16)]) as? [Bool] ?? Array(repeating: false, count: 16));
        for index in 0...15 {
            stateBools[index] = saved[index]
        }
    }

    public func buttonClicked() {
        guard !isUpdatingSwitches else { return }
        isUpdatingSwitches = true
        
        let random: Int = Int.random(in: 1...3)
        for _ in 0...random {
            stateBools[Int.random(in: 0...15)] = Bool.random()
        }

        UserDefaults.standard.set(stateBools, forKey: "levelOne")
        UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "levelOneCount") + 1, forKey: "levelOneCount")
        checkBoard()
    }
    
    func checkBoard() {
        if !stateBools.contains(false) {
            if UserDefaults.standard.integer(forKey: "levelOneCount") < UserDefaults.standard.integer(forKey: "levelOneBest") {
                UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "levelOneCount"), forKey: "levelOneBest")
            }
            self.showSheet = true
        } else {
            isUpdatingSwitches = false
        }
    }
}
