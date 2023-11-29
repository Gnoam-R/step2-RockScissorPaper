//
//  Menu.swift
//  Roh-RockScissorPaper
//
//  Created by Roh on 11/28/23.
//

enum Menu {
    case rsp(userHand: Hand)
    case mgb(userHand: Hand)
    case exit
    
    init(input: Int, isMGB: Bool? = nil) throws {
        if let hand = Hand(rawValue: input), let _ = isMGB {
            self = .mgb(userHand: hand)
        }
        else if let hand = Hand(rawValue: input){
            self = .rsp(userHand: hand)
        }
        else if input == 0 {
            self = .exit
        } else {
            throw ErrorHandling.InvalidInputError
        }
    }
}
