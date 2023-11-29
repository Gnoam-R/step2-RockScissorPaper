//
//  Hand.swift
//  Roh-RockScissorPaper
//
//  Created by Roh on 11/28/23.
//

enum Hand: Int, CaseIterable {
    case rock = 2
    case scissor = 1
    case paper = 3
    
    func wins(_ another: Hand) -> Bool {
        switch self {
        case .rock:
            return another == .scissor
        case .scissor:
            return another == .paper
        case .paper:
            return another == .rock
        }
    }
}
