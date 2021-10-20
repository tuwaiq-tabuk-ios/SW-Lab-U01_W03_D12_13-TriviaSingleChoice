//
//  QuestionManager.swift
//  Quiz App
//
//  Created by Anshul Gupta on 8/24/20.
//  Copyright © 2020 Anshul Gupta. All rights reserved.
//

import Foundation

struct QuizManager {
  
  private let quiz = [
    Question(
      question: " is the largest organ in the human body heart?",
      choices: ["True", "False"],
      answer: "True"
    ),
    Question(question: "is Five dollars is worth how many nickels25?", choices: ["True", "False"], answer: "False"),
    Question(question: " do the letters in the GMT time zone stand for Global Meridian Time?", choices: ["True", "False"], answer: "True"),
    Question(question: " is the French word for 'hat'Chapeau?", choices: ["True", "False"], answer: "False"),
    Question(question: "In past times, what would a gentleman keep in his fob pocket Notebook?", choices: ["True", "False"], answer: "True")]
  
  var questionNumber = 0
  var score = 0
  
  
  mutating func checkAnswer(_ userAnswer:String) -> Bool {
    print(userAnswer)
    print(quiz[questionNumber].answer)
    if userAnswer == quiz[questionNumber].answer{
      score+=1
      return true
    }
    return false
  }
  
  func getQuestion() -> String {
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
  
  
  mutating func nextQuestion() -> Bool {
    questionNumber += 1
    if (questionNumber == quiz.count){
      questionNumber = 0
      score = 0
      return false
    }
    else {
      return true
      
    }
  }
  
}
