//
//  QuestionBank.swift
//  TrivailSingleChoice
//
//  Created by محمد العطوي on 12/03/1443 AH.
//

import Foundation

struct QuestionBank {
    
    var list = [Question]()
    init() {
        list.append(
            Question(questionText: "Madrid, the capital of Spain",
                     choiceA: "true",
                     choiceB: "false",
                     answer: 1)
        )
        list.append(Question(questionText: "Can a person live without water?", choiceA: "true", choiceB: "false", answer: 2))
        list.append(Question(questionText: "Egypt is the largest country in the world", choiceA: "true", choiceB: "false", answer: 2))
        list.append(Question(questionText: "Did Spain win the World Cup?", choiceA: "true", choiceB: "false", answer: 1))
        list.append(Question(questionText: "Was America's first president, George Bush?", choiceA: "true", choiceB: "false", answer: 2))
        
        
    }


}
