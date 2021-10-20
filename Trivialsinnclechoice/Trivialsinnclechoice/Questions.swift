//
//  Questions.swift
//  Trivialsinnclechoice
//
//  Created by azooz alhwiti on 12/03/1443 AH.
//

import Foundation
struct Question{
    
    let question: String
    let optionA: String
    let optionB: String
    let correstAnswer:Int
    
    init (questionsText:String , choiceA:String , choiceB:String,answer:Int ){
        question = questionsText
        optionA = choiceA
        optionB = choiceB
        correstAnswer = answer
    }
    
}
