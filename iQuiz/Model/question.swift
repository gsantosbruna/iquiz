//
//  question.swift
//  iQuiz
//
//  Created by Bruna Santos on 04/09/2023.
//

import Foundation

struct Question {
    var title: String
    var answers: [String]
    var rightAnswer: Int
}

let questions: [Question] = [
    Question(title: "What spell is used to disarm an opponent?", answers: ["Expecto Patronum", "Avade Kedavra", "Expelliarmus"], rightAnswer: 2),
    Question(title: "When it was released the movie Avatar 2?", answers: ["2014", "2022", "2023"], rightAnswer: 1),
    Question(title: "When it was released the movie Avengers: Endgame", answers: ["2019", "2018", "2017"], rightAnswer: 0)
]
