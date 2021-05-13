//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Camilo Moreno on 22/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer:String) {
        self.question = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
}
