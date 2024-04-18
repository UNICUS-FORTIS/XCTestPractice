//
//  ValidationError.swift
//  XCTestPractice
//
//  Created by LOUIE MAC on 4/19/24.
//

import Foundation

enum ValidationError: LocalizedError {
    
    case invalidEmail
    case invalidPassword
    
    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return "유효하지 않은 이메일입니다."
        case .invalidPassword:
            return "유효하지 않은 패스워드입니다."
        }
    }
}
