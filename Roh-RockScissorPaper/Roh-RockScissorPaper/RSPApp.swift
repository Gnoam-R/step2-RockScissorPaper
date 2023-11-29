//
//  RSPApp.swift
//  Roh-RockScissorPaper
//
//  Created by Roh on 11/28/23.
//

import Foundation

class RSPApp {
    
    private var message: MessageHandling
    
    init() {
        message = MessageHandling()
    }
    
    func run() {
        while true {
            // 1. 시작 메시지 출력
            message.output(.menu)
            // 2. 사용자 입력 대기 & menu optional 채크
            do {
                let strMsg = try message.input()
                let intUserInput = try message.strToInt(in: strMsg)
                let menu = try Menu(input: intUserInput)
            // 3. 메뉴 처리
                processMenu(menu)
            // 4. 에러 처리
            } catch let error as ErrorHandling{
                message.output(errorMsg: error.rawValue)
            } catch {
                message.output(errorMsg: "error unknown")
            }
        }
    }
}

extension RSPApp {
    private func processMenu(_ menu: Menu) {
        switch menu {
        case .rsp(let userHand):
            RSPGame(userHand)
        case .mgb(let userHand):
            MGBGame(userHand)
        case .exit:
            message.output(.exit)
        }
    }
    
    func RSPGame(_ userHand: Hand) {
        let userHand = userHand
        let pcHand = Hand.allCases.randomElement() ?? .rock
        let userResult = judgeUserWin(userHand, pcHand)
    }
    func MGBGame(_ userHand: Hand) {
        let userHand = userHand
        let pcHand = Hand.allCases.randomElement() ?? .rock
        let userResult = judgeUserWin(userHand, pcHand, isMGB: true)
    }
    
    private func judgeUserWin(_ userPlayerHand: Hand, _ pcPlayerHand: Hand, isMGB: Bool? = nil) -> RSPResult {
        if let isMGB {
            let MGB = true
            let RSPResult = userPlayerHand.wins(pcPlayerHand, game: MGB) ? RSPResult.win : RSPResult.lose
            return RSPResult
        }
        else if userPlayerHand == pcPlayerHand {
            return .draw
        }
        else {
            let RSPResult = userPlayerHand.wins(pcPlayerHand) ? RSPResult.win : RSPResult.lose
            return RSPResult
        }
    }
}
