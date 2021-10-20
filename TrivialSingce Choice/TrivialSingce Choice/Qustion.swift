//
//  Qustion.swift
//  TrivialSingce Choice
//
//  Created by Yousef Albalawi on 12/03/1443 AH.
//

import Foundation
struct Question {
  
  let qustion :String
  let optionA :String
  let optionB :String
  let correctAnswer : Int
  
  init(questionsText :String,choiceA :String,choiceB :String,answer:Int ) {
    qustion = questionsText
    optionA = choiceA
    optionB = choiceB
    correctAnswer = answer
  }

}
