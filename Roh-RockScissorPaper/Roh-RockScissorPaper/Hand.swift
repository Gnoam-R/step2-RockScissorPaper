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
    
    func wins(_ another: Hand, game _: Bool? = nil) -> Bool {
        // 1. User와 PC의 hand가 같은 경우
        // 승리 했냐 여부를 리턴
        // 2. User와 PC의 hand가 다른 경우
        // 선공을 위한 승리 값을 리턴
        return
    }
    
    
}
