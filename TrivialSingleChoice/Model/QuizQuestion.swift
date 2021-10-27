//
//  QuizQuestion.swift
//  TrivialSingleChoice
//
//  Created by A A on 20/03/1443 AH.
//

import Foundation

struct TriviaBrain {
  
  var questionNumber = 0
  var score = 0
  
  let quiz = [
    Question(q: "Can classes inherit from antoer class?", a: "True"),
    Question(q: "Can structs inherit from antoer struct?",a: "False"),
    Question(q: "Are classes default initialized ?", a: "False"),
    Question(q: "Are structs value type ?", a: "True")
  ]
  
  
  func getQuestionText() -> String {
    return quiz[questionNumber].text
  }
  
  
  func getProgress() -> Float {
    return Float(questionNumber) / Float(quiz.count)
  }
  
  
  mutating func getScore() -> Int {
    return score
  }
  
  
  mutating func nextQuestion() {
    
    if questionNumber + 1 < quiz.count {
      questionNumber += 1
    } else {
      questionNumber = 0
    }
  }
  
  
  mutating func checkAnswer(userAnswer: String) -> Bool {
    if userAnswer == quiz[questionNumber].answer {
      score += 1
      return true
    } else {
      return false
    }
  }
}
