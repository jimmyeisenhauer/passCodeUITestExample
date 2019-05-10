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
        
        let button = app.buttons.firstMatch
        waitForElementToAppear(button)
        button.tap()
        
        sleep(3)  // wait for passcode to appear
        
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        springboard.typeText("H\n")
        
        let success =  app.staticTexts["🏁 Secure Area!!! 🏴‍☠️"]
        XCTAssertTrue(success.exists)
        
        sleep(4) // sleep to pause the test for a bit
        
        let backButton = app.buttons["Passcode Test"]
        backButton.tap()
        
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
