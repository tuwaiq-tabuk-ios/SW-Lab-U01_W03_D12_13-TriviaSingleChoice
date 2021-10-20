//
//  qustionBanke.swift
//  TrivialSingce Choice
//
//  Created by Yousef Albalawi on 12/03/1443 AH.
//

import Foundation

struct QustionBanke {
  
  
  var list = [Question]()
  
  
  init() {
    list.append(Question(questionsText: "location of watch BigBen in Geneva", choiceA: "True", choiceB: "false", answer: 2))
    list.append(Question(questionsText: "Columbus discovered America", choiceA: "True", choiceB: "false", answer: 1))
    list.append(Question(questionsText: "Cathay Hua is the old name of America", choiceA: "True", choiceB: "false", answer: 2))
    list.append(Question(questionsText: "A basketball team consists of 5 players", choiceA: "True", choiceB: "false", answer: 1))
    list.append(Question(questionsText: "The first museum in the world is located in Egypt", choiceA: "True", choiceB: "false", answer: 1))
    list.append(Question(questionsText: "Canberra is the capital of Australia", choiceA: "True", choiceB: "false", answer: 1))
    list.append(Question(questionsText: "Kuwait is the first Arab team to win the World Cup", choiceA: "True", choiceB: "false", answer: 2))
    list.append(Question(questionsText: "It was US President Truman who struck Japan in the atomic bomb", choiceA: "True", choiceB: "false", answer: 1))
    list.append(Question(questionsText: "Beginning of World War I in 1913", choiceA: "True", choiceB: "false", answer: 2))
    list.append(Question(questionsText: "Alhulandiu Bank is the first bank to conduct banking activity in Saudi Arabia", choiceA: "True", choiceB: "false", answer: 1))
  }
  
  
}



