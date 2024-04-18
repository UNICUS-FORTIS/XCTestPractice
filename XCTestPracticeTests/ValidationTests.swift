//
//  ValidationTests.swift
//  XCTestPracticeTests
//
//  Created by LOUIE MAC on 4/19/24.
//

@testable import XCTestPractice
import XCTest

final class ValidationTests: XCTestCase {

    var validation: ValidationCenter!
    let successEmail = "unicus.fortis@gmail.com"
    let failureEmail = "unicus.fortis@gmail"
    let successPassword = "Louie9999@@"
    let failurePassword = "louie9999"
    
    override func setUp() {
        super.setUp()
        validation = ValidationCenter()
    }
    
    override func tearDown() {
        super.tearDown()
        validation = nil
    }
    
    func testValidator_ValidEmail_ReturnTrue() throws {
        XCTAssertNoThrow(try validation.validateEmail(successEmail))
    }
    
    func testValidator_InValidEmail_ReturnFalse() throws {
        let expectedError = ValidationError.invalidEmail
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateEmail(failureEmail)) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func testValidator_InvalidPassword_ReturnTrue() throws {
        XCTAssertNoThrow(try validation.validatePassword(successPassword))
    }
    
    func testValidator_InvalidPassword_ReturnFalse() throws {
        let expectedError = ValidationError.invalidPassword
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validatePassword(failurePassword)) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }
}


