//
//  Question.swift
//  TrivialSingleChoice
//
//  Created by عبدالعزيز البلوي on 12/03/1443 AH.
//

import Foundation
struct question {
  let Question : String
  let optionA :String
  let optionB :String
  let correctAnswer :Int
  init(questionText :String , ChoiceA :String , ChoiceB :String , answer:Int) {
    Question = questionText
    optionA = ChoiceA
    optionB = ChoiceB
    correctAnswer = answer
    
  }
}
