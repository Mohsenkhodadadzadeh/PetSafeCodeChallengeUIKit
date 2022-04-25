//
//  ExtensionTests.swift
//  PetSafeCodeChallengeUIKitTests
//
//  Created by Mohsen on 4/25/22.
//

import XCTest
@testable import PetSafeCodeChallengeUIKit

class ExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvertStringToDate() throws {
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = 2020
        dateComponents.month = 2
        dateComponents.day = 1
        dateComponents.timeZone = TimeZone(abbreviation: "UTC")

        let firstDate = Calendar.current.date(from: dateComponents)
        
        let convertingDate = "2020-02-01".convertToDate()
        
        XCTAssertEqual(firstDate, convertingDate)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
