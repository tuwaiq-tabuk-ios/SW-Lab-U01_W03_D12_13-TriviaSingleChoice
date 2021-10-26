//
//  struct.swift
//  TrivialSingleChoise
//
//  Created by hajer . on 13/03/1443 AH.
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
