//
//  QuestionBank.swift
//  TrivialSingleChoice
//
//  Created by Maha S on 26/10/2021.
//

import Foundation

 struct TriviaBrain {

   private let questions = [
     Question(
      question: "API stands for Application Programming Interface",
      answer: "True"),
    
     Question(
      question: "Berlin is the capital of Germany",
      answer: "True"),
    
     Question(
      question: "Halloween is always celebrated on October 21",
      answer: "False"),
    
     Question(
      question: "Cape Town is the capital of Nourth Africa",
      answer: "False")]
  
  
  
   private  var questionNumber = 0
   private var score = 0


   mutating func isAnswerCorrect(_ userAnswer: String) -> Bool {
     print(userAnswer)
     print (questions[questionNumber].answer)
    
     if userAnswer == questions[questionNumber].answer {
     
       score += 5
       return true
     } else {
       score -= 5
       return false
     }
   }


   func checkQuestion()-> String {
     return questions[questionNumber].question
   }


   func getChoices()->String {
     return questions[questionNumber].answer
   }


   func checkProgress()->Float {
     return (Float(questionNumber)/Float(questions.count))
   }


   func checkScore ()->Int{
     return score
   }


   func getQuestionNumber () -> Int {
     return questionNumber
   }


   mutating func nextQuestion()->Bool {
    
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
