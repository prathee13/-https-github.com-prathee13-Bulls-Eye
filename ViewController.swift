//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Pratheeksha Ravindra Naik on 2018-09-12.
//  Copyright © 2018 com/uregina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0;
    var targetValue: Int = 0;
    var score = 0;
    var round = 0;
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded();        // Do any additional setup after loading the view, typically from a nib.
        currentValue = Int(roundedValue);
        startNewRound();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let diff = abs(targetValue - currentValue)
        
        var points = 100 - diff
        
        score += points
        
        let title: String
        if diff == 0 {
            title = "Perfect!"
            points+=100
        }else if diff < 5 {
            title = "You almost had it!"
            if diff == 1 {
                points += 50
            }
        } else if diff < 10 {
            title = "Pretty goood"
        }else {
            title = "Not even close..."

        }
        let msg = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        });
        
        alert.addAction(action);
        
        present(alert, animated: true, completion: nil);
        
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        
        let roundedValue = slider.value.rounded();
                currentValue = Int(roundedValue);
    }
    
    func startNewRound() {
        round += 1;
        targetValue = Int(arc4random_uniform(100));
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame() {
        score = 0;
        round = 0;
        startNewRound();
    }
    
        
    }


