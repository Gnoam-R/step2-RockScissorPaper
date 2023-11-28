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
    
    init(input: Int) throws {
        if let hand = Hand(rawValue: input){
            self = .mgb(userHand: hand)
            self = .rsp(userHand: hand)
        } else if input == 0 {
            self = .exit
        } else {
            throw ErrorHandling.InvalidInputError
        }
    }
}
