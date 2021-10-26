//
//  Questions  Banc.swift
//  Trivialsinnclechoice
//
//  Created by azooz alhwiti on 12/03/1443 AH.
//

import Foundation
struct QuestionsBanc {
    var list = [Question]()
    init() {
        
        list.append(Question(questionsText: "Saudi Arabia is the largest oil exporter", choiceA: "True", choiceB: "False", answer: 1))
                                                                                
        list.append(Question(questionsText: "Russia is the largest border country in the world", choiceA: "True", choiceB: "False", answer: 1))
        
        list.append(Question(questionsText: "The pyramids are located in Sudan", choiceA: "True", choiceB: "False", answer: 2))
        
        list.append(Question(questionsText: "Banana is a vegetable", choiceA: "True", choiceB: "False", answer: 2))
        
        list.append(Question(questionsText: "Number of days in the calendar year 365", choiceA: "True", choiceB: "False", answer: 1))
        
        
        list.append(Question(questionsText: "The Hijri date is older than the Gregorian calendar", choiceA: "True", choiceB: "False", answer: 2))
    }
    
    
}
