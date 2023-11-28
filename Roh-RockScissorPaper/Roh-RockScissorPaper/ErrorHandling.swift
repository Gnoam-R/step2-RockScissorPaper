//
//  ErrorCase.swift
//  Roh-RockScissorPaper
//
//  Created by Roh on 11/28/23.
//

enum ErrorHandling: String, Error {
    case InvalidInputError = "잘못된 입력입니다. 다시 시도해주세요."
    case EmptyInputError = "빈 입력입니다. 다시 시도해주세요."
}

