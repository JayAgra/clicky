//
//  LevelOneView.swift
//  useless
//
//  Created by Jayen Agrawal on 2/1/24.
//

import SwiftUI

struct LevelOneView: View {
    @ObservedObject public var controller: LevelOneController = LevelOneController()
    public var gameCenterOk: Bool
    
    var body: some View {
        VStack {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(0...3, id: \.self) { row in
                    VStack {
                        ForEach(0...3, id: \.self) { col in
                            controller.levelOneSwitches[(4 * row) + col]
                        }
                    }
                    .padding([.top, .bottom])
                }
            }
        }
        .sheet(isPresented: $controller.showSheet) {
            GameCompleteSheetL1(controller: controller, gameCenterOk: gameCenterOk)
        }
        .onAppear() {
            controller.checkBoard()
        }
    }
}

#Preview {
    LevelOneView(gameCenterOk: false)
}
