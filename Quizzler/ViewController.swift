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
    var score: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
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
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / \(allQuestion.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if allQuestion.list.count > questionNumber {
            questionLabel.text = allQuestion.list[questionNumber].questionText
            updateUI()
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
            ProgressHUD.showSuccess("Correct")
            score += 10
        }
        else {
            ProgressHUD.showError("Wrong answer!")
        }

        questionNumber += 1
        nextQuestion()
        
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}
