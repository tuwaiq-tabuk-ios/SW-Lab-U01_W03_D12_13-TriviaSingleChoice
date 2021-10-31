//
//  QuestionBank.swift
//  TrivialSingleChoice
//
//  Created by Maha S on 26/10/2021.
//




import Foundation

 struct TriviaBrain {

   var questionNumber = 0
   var score = 0

   let quiz = [
     
      Question(
            q: "API stands for Application Programming Interface",
            a: "True"),
  
          Question(
            q: "Berlin is the capital of Germany",
            a: "True"),
  
          Question(
            q: "Halloween is always celebrated on October 21",
            a: "False"),
  
          Question(
            q: "Cape Town is the capital of Nourth Africa",
            a: "False")]

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
       score += 5
       return true
     } else {
      score -= 5
       return false
     }
   }
 }
