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
            print("rsp", userHand)
        case .mgb(let userHand):
            print("mgb", userHand)
        case .exit:
            print("test")
        }
    }
}
