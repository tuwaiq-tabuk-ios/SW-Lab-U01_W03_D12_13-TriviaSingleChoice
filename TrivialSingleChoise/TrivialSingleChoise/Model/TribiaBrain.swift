//
//  struct2.swift
//  TrivialSingleChoise
//
//  Created by rasha  on 13/03/1443 AH.
//

import Foundation
struct TriviaBrain {
  
  var questionNumber = 0
  var score = 0
  
  let questionList = [
    Question(q: "The tallest tower in the world is the Burj Khalifa.", a: "True"),
    Question(q: "The largest country in the world is Kuwait.",a: "False"),
    Question(q: "Riyadh is the capital of the Kingdom of Saudi Arabia.", a: "True"),
    Question(q: "Qassim is the capital of dates in the Kingdom.", a: "True"),
    Question(q: "The largest tropical forest in the world is the Amazon.", a: "True"),
    Question(q: "Jeddah is called the Bride of the Red Sea.", a: "True"),
    Question(q: "Population density is the difference between the number of births and deaths.", a: "False"),
    Question(q: "My moderate use of water ensures that its density continues.", a: "True"),
    Question(q: "One of the rules of work is to determine the wage.", a: "True"),
    Question(q: "Most of the Kingdom's exports of electrical appliances.", a: "False"),
    Question(q: "The scanner is used to enter images into the computer.", a: "True"),
    Question(q: "The microphone is one of the output units.", a: "False")
  ]
  
  func getQuestionText() -> String {
    return questionList[questionNumber].text
  }
  
  func getProgress() -> Float {
    return Float(questionNumber) / Float(questionList.count)
  }
  
  
  mutating func getScore() -> Int {
    return score
  }
  
  
  mutating func nextQuestion() {
    if questionNumber + 1 < questionList.count {
      questionNumber += 1
    } else {
      questionNumber = 0
    }
  }
  
  
  mutating func checkAnswer(userAnswer: String) -> Bool {
    if userAnswer == questionList[questionNumber].answer {
      score += 1
      return true
    } else {
      return false
    }
  }
}
