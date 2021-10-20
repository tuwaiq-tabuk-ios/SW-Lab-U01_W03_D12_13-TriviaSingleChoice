//
//  QuestionManager.swift
//  Quiz App
//
//  Created by Anshul Gupta on 8/24/20.
//  Copyright © 2020 Anshul Gupta. All rights reserved.
//

import Foundation

struct QuizManager {
    
     private let quiz = [
        Question(question: "Which is the largest organ in the human body?", choices: ["Heart", "Skin"], answer: "Skin"),
        Question(question: "Five dollars is worth how many nickels?", choices: ["25", "100"], answer: "100"),
        Question(question: "What do the letters in the GMT time zone stand for?", choices: ["Global Meridian Time", "Greenwich Mean Time"], answer: "Greenwich Mean Time"),
        Question(question: "What is the French word for 'hat'?", choices: ["Chapeau", "Écharpe"], answer: "Chapeau"),
        Question(question: "In past times, what would a gentleman keep in his fob pocket?", choices: ["Notebook", "Watch"], answer: "Watch")]
    
    var questionNumber = 0
    var score = 0
    
    
    mutating func checkAnswer(_ userAnswer:String) -> Bool {
        print(userAnswer)
        print(quiz[questionNumber].answer)
        if userAnswer == quiz[questionNumber].answer{
            score+=1
            return true
        }
        return false
    }
    
    func checkQuestion() -> String {
        return quiz[questionNumber].question
    }
    func checkChoices() -> [String] {
        return quiz[questionNumber].choices
    }
    func checkProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count);
    }
    func checkScore() -> Int {
        return score
    }
    
    mutating func nextQuestion(){
        questionNumber += 1
        if(questionNumber==quiz.count){
            questionNumber=0
            score = 0
        }
    }

    
}
