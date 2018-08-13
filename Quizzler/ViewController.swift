//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var allQuestion = QuestionBank()
    var questionNumber: Int = 0
    var pickedAnswer: Bool = false
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionText = allQuestion.list[questionNumber].questionText
        questionLabel.text = questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if allQuestion.list.count > questionNumber {
            let questionText = allQuestion.list[questionNumber].questionText
            questionLabel.text = questionText
        }
        else {
            
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the question, do you want to start over?", preferredStyle: .alert)
           
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:{ action in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true)
            
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestion.list[questionNumber].answer
        
        if pickedAnswer == correctAnswer {
            print("You got it")
        }
        else {
            print("Wrong answer")
        }

        questionNumber += 1
        nextQuestion()
        
    }
    
    
    func startOver() {
       questionNumber = 0
        nextQuestion()
    }
    

    
}
