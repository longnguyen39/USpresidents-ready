//
//  ViewController.swift
//  USpresidents
//
//  Created by user166398 on 5/28/20.
//  Copyright © 2020 user166398. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var CButton: UIButton!
    @IBOutlet weak var DButton: UIButton!
    
    @IBOutlet weak var ALabel: UILabel!
    @IBOutlet weak var BLabel: UILabel!
    @IBOutlet weak var CLabel: UILabel!
    @IBOutlet weak var DLabel: UILabel!
    
    var questionIndexNumber: Int = 0
    var score: Int = 0
    var pickedAnswer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextQuestion()
        UIupdate()
        animatedButton()
    }

    
    func animatedButton () {
        AButton.layer.cornerRadius = 7
        AButton.layer.shadowRadius = 4
        AButton.layer.shadowOpacity = 0.2
        AButton.layer.shadowOffset = CGSize (width: 4, height: 4)
        
        BButton.layer.cornerRadius = 7
        BButton.layer.shadowRadius = 4
        BButton.layer.shadowOpacity = 0.2
        BButton.layer.shadowOffset = CGSize (width: 4, height: 4)
        
        CButton.layer.cornerRadius = 7
        CButton.layer.shadowRadius = 4
        CButton.layer.shadowOpacity = 0.2
        CButton.layer.shadowOffset = CGSize (width: 4, height: 4)
        
        DButton.layer.cornerRadius = 7
        DButton.layer.shadowRadius = 4
        DButton.layer.shadowOpacity = 0.2
        DButton.layer.shadowOffset = CGSize (width: 4, height: 4)
        
    }
    
    @IBAction func action(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = "A"
        }
        else if sender.tag == 2 {
            pickedAnswer = "B"
        }
        else if sender.tag == 3 {
            pickedAnswer = "C"
        }
        else if sender.tag == 4 {
            pickedAnswer = "D"
        }
        
        checkAnswer()
        
        questionIndexNumber = questionIndexNumber + 1

    }
    
    func UIupdate () {
            if questionIndexNumber < QuestionBank().list.count {
            progressLabel.text = "Your progress is: \(questionIndexNumber+1) / \(QuestionBank().list.count)"
            }
        }
    
    
        func alertCorrect () {
            let alert = UIAlertController(title: "Correct!", message: "Great job. Here is the fact: \(AnswerExplanation().list[questionIndexNumber])", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Next ->", style: .default) { (UIAlertAction) in
                        self.nextQuestion()
                    }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            }
        
    
        func alertWrong () {
            let alert = UIAlertController(title: "Nope!", message: "Oops! Here is the answer: \(AnswerExplanation().list[questionIndexNumber])", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Next question.", style: .default) { (UIAlertAction) in
                self.nextQuestion()
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }



    //gets called when a user just tap on a question
    func checkAnswer () {
            if questionIndexNumber < QuestionBank().list.count {
            
                if pickedAnswer == QuestionBank().list[questionIndexNumber].answer {
                print ("Yeah!!!")
                score = score + 1 //increase the question index
                alertCorrect()
                }
                    
            else {
                print ("You suck")
                alertWrong()
                    
                }
                
            }
        }

    //dictates what happen when we tap "next"
     func nextQuestion () {
            if questionIndexNumber < QuestionBank().list.count {
            questionLabel.text = QuestionBank().list[questionIndexNumber].questionText
                AButton.setTitle(" A. \(QuestionBank().list[questionIndexNumber].A)", for: .normal)
                BButton.setTitle(" B. \(QuestionBank().list[questionIndexNumber].B)", for: .normal)
                CButton.setTitle(" C. \(QuestionBank().list[questionIndexNumber].C)", for: .normal)
                DButton.setTitle(" D. \(QuestionBank().list[questionIndexNumber].D)", for: .normal)
                
            UIupdate()
        }
            else {
                print("done")
                let alert = UIAlertController(title: "You are done!!", message: "your score is \(score) out of \(questionIndexNumber)", preferredStyle: .alert)
                
                let restartAction = UIAlertAction (title: "Restart", style: .default) { (UIAlertAction) in
                    self.restart()
                }
                
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
            }
        }
        

    func restart () {
            questionIndexNumber = 0
            score = 0
            nextQuestion()
            UIupdate()
            
        }
    
}

