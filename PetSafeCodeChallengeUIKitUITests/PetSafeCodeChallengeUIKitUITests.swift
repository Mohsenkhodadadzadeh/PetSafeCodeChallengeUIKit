//
//  PetSafeCodeChallengeUIKitUITests.swift
//  PetSafeCodeChallengeUIKitUITests
//
//  Created by Mohsen on 4/24/22.
//

import XCTest

class PetSafeCodeChallengeUIKitUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testWrongAccessKey() throws {
        
        let app = XCUIApplication()
        app.launchEnvironment = ["access_key": "ea1fbe87cd40f95efc9be8c55023f8267"]
        app.launch()
        let errorAlert = app.alerts["Error"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: errorAlert, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(errorAlert.staticTexts["You have not supplied a valid API Access Key. [Technical Support: support@apilayer.com]"].exists)
        errorAlert.buttons["done"].tap()
        
    }
    
    func testExchangeCurrencies() throws {
        
        let app = XCUIApplication()
        app.launchEnvironment = ["access_key": "ea1fbe87cd40f95efc9be8c55023f826"]
        app.launch()
        let inputTextField = app.textFields["inputTextField"]
        inputTextField.tap()
        inputTextField.typeText("130")
        
        sleep(5)
        app.buttons["calculateButton"].tap()
        
        XCTAssertTrue(app.tables.cells.staticTexts["Canadian Dollar"].exists)
        
    }
    
    func testChangeBaseCurrency() throws {
        
        let app = XCUIApplication()
        app.launchEnvironment = ["access_key": "ea1fbe87cd40f95efc9be8c55023f826"]
        app.launch()
        sleep(5)
        app.buttons["changeCurrency"].tap()
        app.tables.cells.staticTexts["Australian Dollar"].tap()
        app.buttons["DoneButton"].tap()
        if (app.alerts["Error"].exists) {
            app.alerts["Error"].scrollViews.otherElements.buttons["done"].tap()
        }
        
        XCTAssertTrue(app.staticTexts["the base rate is AUD"].exists)
        
        
    }
}
