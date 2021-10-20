//
//  QuestionBank.swift
//  TrivialSingleChoice
//
//  Created by عبدالعزيز البلوي on 12/03/1443 AH.
//

import Foundation
struct questionBank {
  var list = [question]()
  
  init() {
    list.append(question(questionText: "USA Is a country on middle east", ChoiceA: "True", ChoiceB: "False", answer: 2))
    list.append(question(questionText: "The red sea is not red", ChoiceA: "True", ChoiceB: "False", answer: 1))
    list.append(question(questionText: "Elizabith is the queen of france ", ChoiceA: "True", ChoiceB: "False", answer: 2))
    list.append(question(questionText: "Egybt is an arabic country", ChoiceA: "True", ChoiceB: "False", answer: 1))
    list.append(question(questionText: "Jordan is country on middle east ", ChoiceA: "True", ChoiceB: "False", answer: 1))
    list.append(question(questionText: "Apple's operating system is iOS", ChoiceA: "True", ChoiceB: "False", answer: 1))
    list.append(question(questionText: "Swift language used for Android programming", ChoiceA: "True", ChoiceB: "False", answer: 2))
  }
}
