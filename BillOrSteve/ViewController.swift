//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var steveAndBill: [String: [String]] = [:]
    
    func createFacts () {
        let steveFacts = [
            
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        
        let billFacts = [
            
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            
            "He scored 1590 (out of 1600) on his SATs.",
            
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        
        steveAndBill = ["Steve Jobs": steveFacts, "Bill Gates": billFacts]
        
    }
    
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var scoreCounter: UILabel!
    
    @IBOutlet weak var steveLabel: UILabel!
    
    @IBOutlet weak var billLabel: UILabel!
    
    @IBAction func steveButton(sender: AnyObject) {
        buttonsClicked += 1
        
        
        if correctPerson == "Steve Jobs" {
            correctAnswers += 1
            scoreCounter.text = "\(correctAnswers)/9"
            print("Correct")
        }
        else {
                scoreCounter.text = "\(correctAnswers)/9"
                print("Incorrect")
        }
    
        showFact()

        
        
        
//        if scoreCounter.text == "9/9" {
//        factLabel.text = "Trivia Completed"
//            sender.enabled = false; 
//    }
        
        
    }
    
    @IBAction func billButton(sender: AnyObject) {
        buttonsClicked += 1
        

        if correctPerson == "Bill Gates" {
            correctAnswers += 1
            scoreCounter.text = "\(correctAnswers)/9"
            print("Correct")
        }
        else {
            scoreCounter.text = "\(correctAnswers)/9"
            print("Incorrect")
        }
        
        showFact()
        
        
    }
    
    var buttonsClicked = 0
    var correctAnswers = 0

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        getRandomFact()
        factLabel.text = "\(getRandomFact()!.1)"
        correctPerson = "\(getRandomFact()!.0)"
    }
    
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = randomNumberFromZeroTo(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    
    func getRandomFact() -> (String, String)? {
        let person = randomPerson()
        if steveAndBill.keys.contains(person) {
            let facts = steveAndBill[person]
            let randomNumber = randomNumberFromZeroTo(facts!.count)
            let randomFact = facts![randomNumber]
            print("\(person)", "\(randomFact)")
            return ("\(person)", "\(randomFact)")
            
        }
        
        return nil
    }
    
    var correctPerson: String = ""
    
    
    func showFact () {
       let factGenerator = getRandomFact()
        switch factGenerator {
        case ("Steve Jobs", _)?:
            factLabel.text = "\(factGenerator!.1)"
            correctPerson = "Steve Jobs"
        default:
            factLabel.text = "\(factGenerator!.1)"
            correctPerson = "Bill Gates"
            }
    }
    


    
    
    
//    func showFact (fact: String, person: String) {
//        var factGenerator = (firstFact, firstPerson)
//        switch factGenerator {
//        case firstFact == "Steve Jobs":
//            correctAnswers += 1
//            scoreCounter.text = "\(correctAnswers)/9"
//            print("Correct")
//        default: print("none")
//        }
//        
    
    
//    func showFact () {
//        let factGenerator = getRandomFact()!
//        if factGenerator == ("Steve Jobs", "_") {
//            correctAnswers += 1
//            scoreCounter.text = "\(correctAnswers)/9"
//            print("Correct")
//        } else {
//            scoreCounter.text = "\(correctAnswers)/9"
//            print("Incorrect")
//            
//        }
//        
//    }

    
    
    
    
    
}




