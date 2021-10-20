//
//  strcte2.swift
//  TrivialSingleChoise
//
//  Created by ahlam  on 13/03/1443 AH.
//

import Foundation
struct Question2 {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question1(q: "At the design stage, the programming language is selected.", a: "False"),
        Question1(q: "The programming language is the mediator between the computer and the programmer.",a: "True"),
        Question1(q: "The design phase is the first step in the programming process.", a: "False"),
        Question1(q: "Algorithms are limited to software only.", a: "False"),
        Question1(q: "The flowchart forms must be adhered to when designing.", a: "True"),
        Question1(q: "The parts of the program must be linked in a logical way.", a: "True"),
        Question1(q: "TIt is wrong to divide the program into small units.", a: "False"),
        Question1(q: "A programmer can make a computer execute commands a specified number of times.", a: "True"),
        Question1(q: "Mobile phone programming is a necessities.", a: "True"),
        Question1(q: "The largest ocean in the world is the Atlantic Ocean.", a: "False"),
        Question1(q: "HTML is used to program smart devices..", a: "False"),
        Question1(q: "The first commands written to a computer were in 1980.", a: "False")
    ]
    
    
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
            score += 1
            return true
        } else {
            return false
        }
    }
}
