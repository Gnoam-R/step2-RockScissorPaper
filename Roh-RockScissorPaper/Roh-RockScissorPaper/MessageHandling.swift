//
//  showPrompt.swift
//  Roh-RockScissorPaper
//
//  Created by Roh on 11/28/23.
//


class MessageHandling {
    
    let pc: String = "컴퓨터"
    let user: String = "사용자"
    
    enum Message: String {
        case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case draw = "비겼습니다!"
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case exit = "게임 종료"
        case victory = "의 승리"
    }
    
    func input() throws -> String {
        guard let pureInput = Swift.readLine() else { throw ErrorHandling.InvalidInputError }
        let refinedInput = pureInput.trimmingCharacters(in: .whitespacesAndNewlines)
        if refinedInput.isEmpty {
            throw ErrorHandling.InvalidInputError
        }
        else {
            return refinedInput
        }
    }
    
    func output(_ msg: Message, terminator: String? = nil) {
        Swift.print(msg.rawValue, terminator: terminator ?? "\n")
    }
    
    func output(addMsg: String, _ msg: Message, terminator: String? = nil) {
        Swift.print("\(addMsg)\(msg.rawValue)", terminator: terminator ?? "\n")
    }
    
    func output(errorMsg msg: String, terminator: String? = nil) {
        Swift.print(msg, terminator: terminator ?? "\n")
    }
    
    func strToInt(in strMsg: String) throws -> Int {
        guard let intMsg = Int(strMsg) else { throw ErrorHandling.InvalidInputError }
        return intMsg
    }
}
