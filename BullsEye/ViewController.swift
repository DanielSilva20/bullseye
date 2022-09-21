//
//  ViewController.swift
//  BullsEye
//
//  Created by Daniel Silva on 9/21/22.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var roundNumber: Int = 0
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundNumberLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startNewRound()
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: "Hello, World",
            message: message,
            preferredStyle: .alert)

        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        self.startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber += 1
        updateLabes()
    }
    
    func updateLabes() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundNumberLabel.text = String(roundNumber)
    }

}

