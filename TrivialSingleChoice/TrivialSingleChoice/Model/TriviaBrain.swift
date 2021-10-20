//
//  QuestionModel.swift
//  TrivialSingleChoice
//
//  Created by Ressam Al-Thebailah on 13/03/1443 AH.
//

import Foundation

struct TriviaBrain {
  
  private let questions = [
    Question(question: "the sky is blue?", answer:"True"),
    Question(question: "the apple is black?", answer: "False"),
    Question(question: "the book is orange?", answer:"True"),
    Question(question: "the water is yellow?", answer: "False")]
  private  var questionNumber = 0
  private var score = 0
  
  
  mutating func isAnswerCorrect(_ userAnswer: String) -> Bool {
    print(userAnswer)
    print (questions[questionNumber].answer)
    //let correctAnswer = (questions[questionNumber].answer)
    if userAnswer == questions[questionNumber].answer {
      //questionNumber += 1
      score += 5
      return true
    } else {
      score -= 5
      return false
    }
  }
  
  
  func getQuestion()->String {
    return questions[questionNumber].question
  }
  
  
  func getChoices()->String {
    return questions[questionNumber].answer
  }
  
  
  func getProgress()->Float {
    return (Float(questionNumber+1)/Float(questions.count))
  }
  
  
  func getScore ()->Int{
    return score
  }
  
  
  func getQuestionNumber () -> Int {
    return questionNumber
  }
  
  
  mutating func nextQuestion()->Bool {
   // questionNumber += 1
    if(questionNumber + 1 < questions.count){
      questionNumber += 1
      return true
    } else{
      return false
    }
  }
  mutating func startGame(){
    score = 0
    questionNumber = 0
  }
}

