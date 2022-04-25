//
//  ServicesTests.swift
//  PetSafeCodeChallengeUIKitTests
//
//  Created by Mohsen on 4/25/22.
//

import XCTest
@testable import PetSafeCodeChallengeUIKit

class ServicesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessResponse() throws {
        
        let localObject = RatesEntity(AUD: 0.95, USD: 1, EUR: 1.1, JPY: 0.09, GBP: 1.3, CAD: 0.95, CHF: 0.12, CNY: 0.07, SEK: 0.1, NZD: 0.6)
        
        
        let localData = """
{
    "AUD": 0.95,
    "USD": 1,
    "EUR": 1.1,
    "JPY": 0.09,
    "GBP": 1.3,
    "CAD": 0.95,
    "CHF": 0.12,
    "CNY": 0.07,
    "SEK": 0.1,
    "NZD": 0.6
}
"""
            .data(using: .ascii)
        
        var successResponse: NetworkChainProtocol = SuccessResponse()
        var fixerErrorResponse: NetworkChainProtocol = FixerErrorResponse()
        let internalServerError: NetworkChainProtocol = InternalServerError()
        
        
        successResponse.next = fixerErrorResponse
        fixerErrorResponse.next = internalServerError
        
        let proccesdData: RatesEntity = try! successResponse.calculate(localData!, status: 200)
        XCTAssertEqual(localObject, proccesdData)
        
    }
    
    func testFixerErrorResponse() throws {
        
        let localData = """
{
  "success": false,
  "error": {
    "code": 105,
    "info": "The current subscription plan does not support this API endpoint."
  }
}
"""
            .data(using: .utf8)
        
        var successResponse: NetworkChainProtocol = SuccessResponse()
        var fixerErrorResponse: NetworkChainProtocol = FixerErrorResponse()
        let internalServerError: NetworkChainProtocol = InternalServerError()
        
        
        successResponse.next = fixerErrorResponse
        fixerErrorResponse.next = internalServerError
        do {
        let proccesdData: BaseEntity = try successResponse.calculate(localData!, status: 200)
        } catch let ex as NetworkErrors{
            XCTAssertEqual(ex.errorDescription, "The current subscription plan does not support this API endpoint.")
        }
        
    }
    
    func testInternalServerError() throws {
        let dummyData = "dummy".data(using: .ascii)
        var ssuccessResponse: NetworkChainProtocol = SuccessResponse()
        var fixerErrorResponse: NetworkChainProtocol = FixerErrorResponse()
        let internalServerError: NetworkChainProtocol = InternalServerError()
        
        ssuccessResponse.next = fixerErrorResponse
        fixerErrorResponse.next = internalServerError
        
        do {
        let _: BaseEntity = try ssuccessResponse.calculate(dummyData!, status: 500)
            
        } catch let ex as NetworkErrors{
            XCTAssertEqual(ex.errorDescription, NetworkErrors.internalServerError.errorDescription)
        }
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension RatesEntity: Equatable {
    public static func == (lhs: RatesEntity, rhs: RatesEntity) -> Bool {
       
        lhs.AUD == rhs.AUD &&
        lhs.USD == rhs.USD &&
        lhs.EUR == rhs.EUR &&
        lhs.JPY == rhs.JPY &&
        lhs.GBP == rhs.GBP &&
        lhs.CAD == rhs.CAD &&
        lhs.CHF == rhs.CHF &&
        lhs.CNY == rhs.CNY &&
        lhs.SEK == rhs.SEK &&
        lhs.NZD == rhs.NZD
    }
}

extension ErrorEntity: Equatable {
    public static func == (lhs: ErrorEntity, rhs: ErrorEntity) -> Bool {
        lhs.code == rhs.code &&
        lhs.info == rhs.info
    }
    
    
}
