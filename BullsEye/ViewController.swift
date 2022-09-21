//
//  ViewController.swift
//  BullsEye
//
//  Created by Daniel Silva on 9/21/22.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue = 0
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startNewRound()
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" +
                      "\nThe target value is: \(targetValue)"
        
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
        updateLabes()
    }
    
    //comment
    func updateLabes() {
        targetLabel.text = String(targetValue)
    }

}

