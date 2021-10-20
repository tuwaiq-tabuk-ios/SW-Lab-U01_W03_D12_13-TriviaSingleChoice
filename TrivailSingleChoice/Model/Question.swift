//
//  Question.swift
//  TrivailSingleChoice
//
//  Created by محمد العطوي on 12/03/1443 AH.
//

import Foundation
struct Question {
   
    let question : String
    
    let optionA : String
    
    let optionB : String
    
    let correctAnswer: Int
    
    
    init(questionText: String ,
         choiceA: String ,
         choiceB: String ,
         answer: Int) {
        
        question = questionText
        optionA = choiceA
        optionB = choiceB
        correctAnswer = answer
    }
    
}
