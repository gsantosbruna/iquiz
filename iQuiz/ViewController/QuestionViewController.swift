//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Bruna Santos on 04/09/2023.
//

import UIKit

class QuestionViewController: UIViewController {

    var score = 0
    var questionNumber = 0
    
    @IBOutlet weak var titleQuestionLabel: UILabel!
    @IBOutlet var buttonAnswers: [UIButton]!
    
    @IBAction func answerPressedButton(_ sender: UIButton) {
        let userGotItRight = questions[questionNumber].rightAnswer == sender.tag
        
        if userGotItRight {
            score += 1
            sender.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
        } else {
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
        }
        
        if questionNumber < questions.count - 1 {
            questionNumber += 1
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(setupQuestion), userInfo: nil, repeats: false)
        } else {
            
            browseToPerformanceScreen()
        }
        
    }
    
    func browseToPerformanceScreen() {
        
        performSegue(withIdentifier: "GoToPerformanceScreen", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupQuestion()
    }

   
    func setupLayout () {
        navigationItem.hidesBackButton = true
        titleQuestionLabel.numberOfLines = 0
        titleQuestionLabel.textAlignment = .center
        
        for button in buttonAnswers {
            button.layer.cornerRadius = 12.0
        }
    }
    
    @objc func setupQuestion() {
        titleQuestionLabel.text = questions[questionNumber].title
        for button in buttonAnswers {
            let titleButton = questions[questionNumber].answers[button.tag]
            button.setTitle(titleButton, for: .normal)
            button.backgroundColor = UIColor(red: 116/155, green: 50/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let performanceVC = segue.destination as? PerformanceViewController else { return }
        performanceVC.score = score
    }

}
