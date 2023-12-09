//
//  showPrompt.swift
//  Roh-RockScissorPaper
//
//  Created by Roh on 11/28/23.
//


class MessageHandling {
   

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
    
    func output(addMsg: String?, _ msg: Message, terminator: String? = nil) throws {
        guard let resultMsg = addMsg else {
            throw ErrorHandling.InvalidInputError
        }
        Swift.print("\(resultMsg)\(msg.rawValue)", terminator: terminator ?? "\n")
    }
    
    func output(errorMsg msg: String, terminator: String? = nil) {
        Swift.print(msg, terminator: terminator ?? "\n")
    }
    
    func strToInt(in strMsg: String) throws -> Int {
        guard let intMsg = Int(strMsg) else { throw ErrorHandling.InvalidInputError }
        return intMsg
    }
}
