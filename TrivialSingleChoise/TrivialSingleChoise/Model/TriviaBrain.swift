//
//  structerQuestion2.swift
//  TrivialSingleChoise
//
//  Created by hajer . on 13/03/1443 AH.
//

import Foundation

struct TriviaBrain {
  
  var questionNumber = 0
  var score = 0
  
  let questions = [
    Question(q: "The famous Big Ben is located in the city of London.", a: "True"),
    Question(q: "A fox is a predator, if he gets hungry, he eats his young.",a: "False"),
    Question(q: "The term black gold to petroleum.", a: "True"),
    Question(q: "Geology is the science of the earth.", a: "True"),
    Question(q: "America's discoverer, Columbus.", a: "True"),
    Question(q: "The basketball team consists of 5 players.", a: "True"),
    Question(q: "The Nile River originates in Egypt.", a: "False"),
    Question(q: "The official language of Argentina is Spanish.", a: "True"),
    Question(q: "The Great Wall of China is 2,400 km long.", a: "True"),
    Question(q: "The largest ocean in the world is the Atlantic Ocean.", a: "False"),
    Question(q: "The capital of Australia is Canberra.", a: "True"),
    Question(q: "Uganda's largest city in Africa.", a: "False")
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







