//
//  iQuizTests.swift
//  iQuizTests
//
//  Created by Bruna Santos on 03/09/2023.
//
import XCTest
@testable import iQuiz

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
    }
    
    func testButtonStartQuizExists() {
        XCTAssertNotNil(viewController.ButtonStartQuiz)
    }
    
    func testSetupLayout() {
        viewController.setupLayout()
        XCTAssertEqual(viewController.ButtonStartQuiz.layer.cornerRadius, 12.0)
        XCTAssertTrue(viewController.navigationItem.hidesBackButton)
    }
}
