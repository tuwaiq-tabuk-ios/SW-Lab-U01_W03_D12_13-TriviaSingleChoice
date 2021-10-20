//
//  QuestionManager.swift
//  TrivialSingleChoice
//
//  Created by macbook air on 12/03/1443 AH.
//

import Foundation
struct QuizManager {
  let quiz = [
    
    Question(question: "London is located in Germany?", choices: ["True", "False"], answer: "False"),
    Question(question: "The language of Saudi Arabia is English?", choices: ["True", "False"], answer: "False"),
    Question(question: "Riyadh capital of Saudi?", choices: ["True", "False"], answer: "True"),
    Question(question: "Paris capital of Faance?", choices: ["True", "False"], answer: "True"),
    Question(question: "currency of Saudi is riyal?", choices: ["True", "False"], answer: "True")]

 private var questionNumber = 0
  var score = 0
  mutating func checkAnswer(_ userAnswer:String) -> Bool {
    print(userAnswer)
    print(quiz[questionNumber].answer)
    if userAnswer == quiz[questionNumber].answer{
      score+=1
      return true;
    }
    return false;
  }
  
  func checkQuestion() -> String {
    return quiz[questionNumber].question
  }
  func checkChoices() -> [String] {
    return quiz[questionNumber].choices
  }
  func checkProgress() -> Float {
    return Float(questionNumber) / Float(quiz.count);
  }
  func checkScore() -> Int {
    return score
  }
  
  func getQuestionNumber() -> Int {
    return questionNumber
  }
  
  mutating func nextQuestion() -> Bool{
    questionNumber += 1
    if (questionNumber == quiz.count) {
      questionNumber = 0
      score = 0
      return false
    }
    else {
      return true
    }
  }
}
