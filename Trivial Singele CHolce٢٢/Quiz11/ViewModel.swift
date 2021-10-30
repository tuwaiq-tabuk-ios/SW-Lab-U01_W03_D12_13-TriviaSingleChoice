//
//  ViewModel.swift
//  Quiz11
//
//  Created by apple on 25/03/1443 AH.
//

import Foundation
class ViewModel {
    var question: QuestionModel {
        questions[currentQuestionIndex]
    }
    let questions: [QuestionModel] = [
        QuestionModel(question: "The computer is made up of software and hardware?", answer: true),
      QuestionModel(question: "The printer is a hardware device?", answer: true),
      QuestionModel(question: "microphone from output devi?", answer: false),
      QuestionModel(question: "Keyboard of modular and modular release?", answer: false),
      QuestionModel(question: "The screen is from the input units only?", answer: false),
      QuestionModel(question: "Swift is open source?", answer: true),
      QuestionModel(question: "The computer has memory?", answer: true),
      QuestionModel(question: "printer output unit?", answer: true),
      QuestionModel(question: "headphone input unit?", answer: false),
      QuestionModel(question: "barcode output unit?", answer: false),

    ]
    var currentQuestionIndex: Int = 0
    var score: Int = 0
    var correct: Int = 0
    var wrong: Int = 0
    
    func check(answer: Bool) -> Bool {
        if question.answer == answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
  
}
