//
//  LevelTwoView.swift
//  useless
//
//  Created by Jayen Agrawal on 2/1/24.
//

import SwiftUI

struct LevelTwoView: View {
    @ObservedObject public var controller: LevelTwoController = LevelTwoController()
    public var gameCenterOk: Bool
    
    var body: some View {
        VStack {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(0...3, id: \.self) { row in
                    VStack {
                        ForEach(0...5, id: \.self) { col in
                            controller.levelTwoSwitches[(6 * row) + col]
                        }
                    }
                    .padding([.top, .bottom])
                }
            }
        }
        .sheet(isPresented: $controller.showSheet) {
            GameCompleteSheetL2(controller: controller, gameCenterOk: gameCenterOk)
        }
        .onAppear() {
            controller.checkBoard()
        }
    }
}

#Preview {
    LevelTwoView(gameCenterOk: false)
}
