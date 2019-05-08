//
//  EisenhauerPassCodeUITestExampleUITests.swift
//  EisenhauerPassCodeUITestExampleUITests
//
//  Created by James Eisenhauer on 5/7/19.
//  Copyright © 2019 James Eisenhauer. All rights reserved.
//

import XCTest

class EisenhauerPassCodeUITestExampleUITests: XCTestCase {

    func testPassCodeSimulator() {
        
        let app = XCUIApplication()
        
        continueAfterFailure = true
        app.launch()
        
        let addButton = app.navigationBars["Master"].buttons["Add"]
        waitForElementToAppear(addButton)
        addButton.tap()

        let firstRow = app.tables.staticTexts.firstMatch
        firstRow.tap()
        
        sleep(3)  // wait for passcode to appear
        XCUIDevice.shared.press(XCUIDevice.Button.home)
        
        let success =  app.staticTexts["Success!"]
        XCTAssertTrue(success.exists)
        
        sleep(3) // sleep to pause the test for a bit
    }
    
    
    fileprivate func waitForElementToAppear(_ element: XCUIElement,
                                            file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate,
                    evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: 5) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 5 seconds."
                self.recordFailure(withDescription: message,
                                   inFile: file, atLine: Int(line), expected: true)
            }
        }
    }

}
