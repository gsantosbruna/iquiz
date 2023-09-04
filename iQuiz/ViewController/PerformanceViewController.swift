//
//  PerformanceViewController.swift
//  iQuiz
//
//  Created by Bruna Santos on 04/09/2023.
//

import UIKit

class PerformanceViewController: UIViewController {
    
    var score: Int?

    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var finalScore: UILabel!
    
    
    @IBOutlet weak var buttonRestartQuiz: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupPerformance()
    }
    
    func setupLayout () {
        navigationItem.hidesBackButton = true
        buttonRestartQuiz.layer.cornerRadius = 12.0
    }
    
    func setupPerformance() {
        guard let score = score else { return }
        resultLabel.text = "You got \(score) out of \(questions.count) questions"
        let finalScoreValue = (score*100)/questions.count
        finalScore.text = "Final score \(finalScoreValue)%"
    }
}
