//
//  Question.swift
//  TrivialSingleChoice
//
//  Created by Maha S on 26/10/2021.
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
