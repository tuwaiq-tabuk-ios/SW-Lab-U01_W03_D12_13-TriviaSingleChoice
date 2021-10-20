//
//  Structr 1.swift
//  TrivialSingleChoise
//
//  Created by arwa balawi on 13/03/1443 AH.
//

import Foundation

struct Question2 {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question1(q: "Low-dose aspirin may prevent a second heart attack",
                  a: "True"),
        Question1(q: " Obesity is the biggest risk factor for heart disease.",
                  a: "False"),
        Question1(q: "Back pain could be a sign of a heart attack ",
                  a: "True"),
        Question1(q: "Fiber can reduce cholesterol",
                  a: "True"),
        Question1(q: "You need to cut back on salt for the health of your heart",
                  a: "True")/*,
        Question1(q: "Eat less lean foods to protect your heart",
                  a: "True"),
        Question1(q: "Your heart needs one hour in a row of hard exercise every day ",
                  a: "False"),
        Question1(q: "Stress and depression affect the hearts of women more than men ",
                  a: "True"),
        Question1(q: "The heart is located slightly to the left of the center of the chest",
                  a: "True"),
        Question1(q: "Your heart stops beating when a heart attack occurs",
                  a: "False"),
        Question1(q: "Sweating and heart pain are warning signs of heart disease ",
                  a: "True"),
        Question1(q: "You may have high cholesterol just because of what you eat",
                  a: "False")*/
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
            score = 0
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
