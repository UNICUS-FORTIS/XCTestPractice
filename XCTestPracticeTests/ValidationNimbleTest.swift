//
//  ValidationNimbleTest.swift
//  XCTestPracticeTests
//
//  Created by LOUIE MAC on 4/19/24.
//

@testable import XCTestPractice
import Nimble
import Quick
//

final class ValidationNimbleTest: QuickSpec {
    
    override class func spec() {
        
        let successEmail = "unicus.fortis@gmail.com"
        let failureEmail = "unicus.fortis@gmail"
        let successPassword = "Louie9999@@"
        let failurePassword = "louie9999"
        
        describe("유효성 검사") {
            
            var sut: ValidationCenter!
            
            beforeEach {
                sut = ValidationCenter()
            }
            
            context("이메일 유효성 검증") {
                it("유효한 이메일 검증") {
                    let validate = try sut.validateEmail(successEmail)
                    expect { validate }.to(equal(successEmail))
                }
                
                it("유효하지 않은 이메일 검증") {
                    let expectedError = ValidationError.invalidEmail
                    var error: ValidationError?
                    
                    expect { try sut.validateEmail(failureEmail) }.to(throwError { error in
                        guard let validationError = error as? ValidationError else { 
                            fail("에러 확인 실패, \(error)")
                            return
                        }
                        expect(validationError).to(equal(expectedError))
                    })
                }
            }
            
            context("비밀번호 유효성 검증") {
                it("유효한 비밀번호 검증") {
                    let validate = try sut.validatePassword(successPassword)
                    expect { validate }.to(equal(successPassword))
                }
                
                it("유효하지 않은 비밀번호 검증") {
                    let expectedError = ValidationError.invalidPassword
                    var error: ValidationError?
                    
                    expect { try sut.validatePassword(failurePassword) }.to(throwError { error in
                        guard let validationError = error as? ValidationError else {
                            fail("에러 확인 실패, \(error)")
                            return
                        }
                        expect(validationError).to(equal(expectedError))
                    })
                }
            }
        }
    }
}
