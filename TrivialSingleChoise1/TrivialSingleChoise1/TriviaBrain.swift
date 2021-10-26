//
//  TriviaBrain.swift
//  TrivialSingleChoise1
//
//  Created by bushra nazal alatwi on 20/03/1443 AH.
//

import Foundation
struct TriviaBrain {
  
  var questionNumber = 0
  var score = 0
  
  let questions = [
    SingleChoiesQuestion(q: "The famous Big Ben is located in the city of London.", a: "True"),
    SingleChoiesQuestion(q: "A fox is a predator, if he gets hungry, he eats his young.",a: "False"),
    SingleChoiesQuestion(q: "The term black gold to petroleum.", a: "True"),
    SingleChoiesQuestion(q: "Geology is the science of the earth.", a: "True"),
    SingleChoiesQuestion(q: "America's discoverer, Columbus.", a: "True"),
    SingleChoiesQuestion(q: "The basketball team consists of 5 players.", a: "True"),
    SingleChoiesQuestion(q: "The Nile River originates in Egypt.", a: "False"),
    SingleChoiesQuestion(q: "The official language of Argentina is Spanish.", a: "True"),
    SingleChoiesQuestion(q: "The Great Wall of China is 2,400 km long.", a: "True"),
    SingleChoiesQuestion(q: "The largest ocean in the world is the Atlantic Ocean.", a: "False"),
    SingleChoiesQuestion(q: "The capital of Australia is Canberra.", a: "True"),
    SingleChoiesQuestion(q: "Uganda's largest city in Africa.", a: "False")
  ]
  
  
  func getQuestionText() -> String {
    return questions[questionNumber].text
  }
  
  
  func getProgress() -> Float {
    return Float(questionNumber) / Float(questions.count)
  }
  
  
  mutating func getScore() -> Int {
    return score
  }
  
  
  mutating func nextQuestion() {
    if questionNumber + 1 < questions.count {
      questionNumber += 1
    } else {
      questionNumber = 0
        
    }
  }
  
  mutating func checkAnswer(userAnswer: String) -> Bool {
    if userAnswer == questions[questionNumber].answer {
      score += 1
      return true
    } else {
      return false
    }
  }
}
