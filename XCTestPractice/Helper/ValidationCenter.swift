//
//  ValidationCenter.swift
//  XCTestPractice
//
//  Created by LOUIE MAC on 4/19/24.
//

import Foundation


struct ValidationCenter {
    
    func validateEmail(_ email: String) throws -> String {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        guard emailTest.evaluate(with: email) else {
            throw ValidationError.invalidEmail
        }
        return email
    }
    
    func validatePassword(_ password: String) throws -> String {
        let passwordRegex = "(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*()_+{}:<>?])[A-Za-z\\d!@#$%^&*()_+{}:<>?]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        guard passwordTest.evaluate(with: password) else {
            throw ValidationError.invalidPassword
        }
        return password
    }
}
