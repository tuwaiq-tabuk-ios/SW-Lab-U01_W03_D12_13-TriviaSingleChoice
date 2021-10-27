//
//  Question.swift
//  TrivialSingleChoice
//
//  Created by A A on 20/03/1443 AH.
//

import Foundation

struct Question {
  let text: String
  let answer: String
  
  init(q: String, a: String) {
    text = q
    answer = a
  }
}
