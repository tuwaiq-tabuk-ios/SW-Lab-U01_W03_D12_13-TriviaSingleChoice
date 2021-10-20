//
//  TriviaBrain.swift
//  TrivialSingleChoise
//
//  Created by ahlam  on 14/03/1443 AH.
//

import Foundation

struct TriviaBrain {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(q: "At the design stage, the programming language is selected.", a: "False"),
        Question(q: "The programming language is the mediator between the computer and the programmer.",a: "True"),
        Question(q: "The design phase is the first step in the programming process.", a: "False"),
        Question(q: "Algorithms are limited to software only.", a: "False"),
        Question(q: "The flowchart forms must be adhered to when designing.", a: "True"),
        Question(q: "The parts of the program must be linked in a logical way.", a: "True"),
        Question(q: "TIt is wrong to divide the program into small units.", a: "False"),
        Question(q: "A programmer can make a computer execute commands a specified number of times.", a: "True"),
        Question(q: "Mobile phone programming is a necessities.", a: "True"),
        Question(q: "The largest ocean in the world is the Atlantic Ocean.", a: "False"),
        Question(q: "HTML is used to program smart devices..", a: "False"),
        Question(q: "The first commands written to a computer were in 1980.", a: "False")
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

