//  iQuizUITests.swift
//  iQuizUITests
//
//  Created by Bruna Santos on 03/09/2023.
//

import XCTest

final class iQuizUITests: XCTestCase {
    func testStart() throws {
        let app = XCUIApplication()
        app.launch()
        app.staticTexts["Start Quiz"].tap()
        XCTAssert(app.buttons.count == 3)
    }
}
