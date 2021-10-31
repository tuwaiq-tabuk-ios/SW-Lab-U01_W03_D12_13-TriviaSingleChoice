//
//  Questions.swift
//  TrivialSingleChoice
//
//  Created by Maha S on 26/10/2021.
//

import Foundation
struct quiz {
  
private let questions = [QuizQuestion(
                            question: "API stands for Application Programming Interface",
                            answer: true),
                         QuizQuestion(
                            question: "Berlin is the capital of Germany",
                            answer: true),
                         QuizQuestion(
                            question: "Halloween is always celebrated on October 21",
                            answer: false),
                         QuizQuestion(
                            question: "Cape Town is the capital of Nourth Africa",
                            answer: false)]


   var qustionNumber = 0
   var score = 0

   mutating func isAnswerCorrect(userAnswer: String) -> Bool{

     print(userAnswer)
     print(questions[qustionNumber].Answer!)

     let correctQuestion = (questions[qustionNumber].Answer)
     if userAnswer == correctQuestion{

       score += 2
       return true
     }else{
       return false
     }
   }


   func getQuestion()-> String {
     list[qustionNumber].TheQuestions
   }


   func getChoices()-> String{
     return list[qustionNumber].Answer
   }


   func getProgress()->Float{
     return (Float(qustionNumber+1)/Float(list.count))
   }


   func getScore()-> Int {
     return score
   }


   func getQuestionLabelText() -> String {
     questions[qustionNumber].TheQuestions
   }


   mutating func nextQuestion() -> Bool{

     if (qustionNumber + 1 < list.count) {
       qustionNumber += 1
       return true

     }else{
       return false
     }
   }


   mutating func startGame(){
     score = 0
     qustionNumber = 0
   }
 }
