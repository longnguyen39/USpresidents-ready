//
//  Question.swift
//  USpresidents
//
//  Created by user166398 on 5/28/20.
//  Copyright © 2020 user166398. All rights reserved.
//

import Foundation

    class Question {
        var questionText: String
        var answer: String
        var A: String
        var B: String
        var C: String
        var D: String
        
        init (text: String, correctAnswer: String, AAnswer: String, BAnswer: String, CAnswer: String, DAnswer: String) {
            
            questionText = text
            answer = correctAnswer
            A = AAnswer
            B = BAnswer
            C = CAnswer
            D = DAnswer
        
    }
}
