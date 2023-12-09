//
//  RSPApp.swift
//  Roh-RockScissorPaper
//
//  Created by Roh on 11/28/23.
//

import Foundation

class RSPApp {

    private var message: MessageHandling
    private var isRunning: Bool = true
    private var isMGB: Bool = false
    private var userFirst = true
    private var firstAttacker = ""
    
    init() {
        message = MessageHandling()
    }
    
    func run() {
        // loop
        while isRunning {
            do {
                // 사용자 메뉴 출력
                if isMGB { try message.output(addMsg: "[\(firstAttacker) 턴]",.menu) }
                else { message.output(.menu) }
                // 사용자 입력 처리
                let strMsg = try message.input()
                let intUserInput = try message.strToInt(in: strMsg)
                // 게임 메뉴 확인 및 실행
                let menu = try Menu(input: intUserInput, game: isMGB)
                processMenu(menu)
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
        let userResult = judgeUserWinRSP(userHand)
        handleResult(userResult)
    }
    
    func MGBGame(_ userHand: Hand) {
        let userResult = judgeUserWinMGB(userHand)
        handleResult(userResult)
    }
    
    // mgb game
    private func judgeUserWinMGB(_ userPlayerHand: Hand) -> MGBResult {
        let pcPlayerHand = Hand.allCases.randomElement() ?? .rock
        if userPlayerHand == pcPlayerHand {
            return .win
        }
        let MGBResult = userPlayerHand.wins(pcPlayerHand) ? MGBResult.firstHit : MGBResult.secondHit
        return MGBResult
    }
    
    // rsp game
    private func judgeUserWinRSP(_ userPlayerHand: Hand) -> RSPResult {
        let pcPlayerHand = Hand.allCases.randomElement() ?? .rock
        if userPlayerHand == pcPlayerHand {
            return .draw
        }
        else {
            let RSPResult = userPlayerHand.wins(pcPlayerHand) ? RSPResult.win : RSPResult.lose
            return RSPResult
        }
    }
    
    // mgb game
    private func handleResult(_ result: MGBResult) {
        switch result {
        case .win:
            isUserWinMGB()
            isRunning = false
        case .lose:
            message.output(errorMsg: "not use")
        case .firstHit:
            isUserAttack(First: true)
        case .secondHit:
            isUserAttack(First: false)
        }
    }
    // rsp game
    private func handleResult(_ result: RSPResult) {
        switch result {
        case .draw:
            message.output(.draw)
        case .win:
            message.output(.win)
            startMGB()
            isUserAttack(First: true)
        case .lose:
            message.output(.lose)
            startMGB()
            isUserAttack(First: false)
        }
    }
    
}

extension RSPApp {
    
    private func startMGB() {
        isMGB = true
    }
    
    private func doneMBG() {
        isMGB = false
    }
    
    private func isUserAttack(First result: Bool) {
        userFirst = result
        if userFirst {
            firstAttacker = Player.user.rawValue
        }
        else {
            firstAttacker = Player.pc.rawValue
        }
    }
    
    private func isUserWinMGB() {
        if userFirst {
            try message.output(addMsg: Player.user.rawValue, .victory)
        }
        else {
            try message.output(addMsg: Player.pc.rawValue, .victory)
        }
    }
    
}
