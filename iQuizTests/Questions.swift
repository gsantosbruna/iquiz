//
//  Questions.swift
//  iQuizTests
//
//  Created by Bruna Santos on 04/09/2023.
//

import XCTest
@testable import iQuiz

class QuestionViewControllerTests: XCTestCase {
    var viewController: QuestionViewController!

    override func setUp() {
        super.setUp()
        
        // Make sure the following are correct:
        let storyboardName = "Main" // Replace with your storyboard name
        let viewControllerIdentifier = "QuestionViewController" // Ensure it matches the storyboard ID
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? QuestionViewController
        
        // Load the view hierarchy
        viewController.loadViewIfNeeded()
        viewController.viewDidLoad()
    }


    override func tearDown() {
        viewController = nil
        super.tearDown()
    }

    func testSetupLayout() {
        XCTAssert(viewController.navigationItem.hidesBackButton)
        XCTAssertEqual(viewController.titleQuestionLabel.numberOfLines, 0)
        XCTAssertEqual(viewController.titleQuestionLabel.textAlignment, .center)
        for button in viewController.buttonAnswers {
            XCTAssertEqual(button.layer.cornerRadius, 12.0)
        }
    }

    func testSetupQuestion() {
        setUp()
        let questionNumber = 0
        viewController.questionNumber = questionNumber
        viewController.setupQuestion()
        
        XCTAssertEqual(viewController.titleQuestionLabel.text, questions[questionNumber].title)
        
        for (index, button) in viewController.buttonAnswers.enumerated() {
            let expectedTitle = questions[questionNumber].answers[index]
            XCTAssertEqual(button.currentTitle, expectedTitle)
            XCTAssertEqual(button.backgroundColor, UIColor(red: 116/155, green: 50/255, blue: 255/255, alpha: 1.0))
        }
    }

    func testAnswerPressedButton() {
        let initialScore = viewController.score
        let questionNumber = viewController.questionNumber
        let buttonIndex = questions[questionNumber].rightAnswer
        
        viewController.answerPressedButton(viewController.buttonAnswers[buttonIndex])
        
        XCTAssertEqual(viewController.score, initialScore + 1)
        XCTAssertEqual(viewController.buttonAnswers[buttonIndex].backgroundColor, UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0))
    }

    func testPrepareForSegue() {
        let performanceVC = PerformanceViewController()
        let segue = UIStoryboardSegue(identifier: "GoToPerformanceScreen", source: viewController, destination: performanceVC)
        
        viewController.prepare(for: segue, sender: nil)
        
        XCTAssertEqual(performanceVC.score, viewController.score)
    }

}

