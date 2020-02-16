//
//  ViewController.swift
//  ColorGuessingGame
//
//  Created by Melinda Diaz on 1/28/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit
//TODO: Make a user defaults to keep HighScore!!
//TODO: Make sounds and Unit TESTS!!!

class ViewController: UIViewController {
    var score = 0
    var highScore = 0
  
    private var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateTargetGamePlay()
        mainView.playAgainButtonPressed.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
         self.showAlert(title: "Rules For Color Guessing Game", message: "Tap the color bubble that MOST resembles the color on the screen.")
    }
    
    func activateTargetGamePlay() {
        
        mainView.redButtonPressed.addTarget(self, action: #selector(gamePlay(_:)), for: .touchUpInside)
        mainView.blueButtonPressed.addTarget(self, action: #selector(gamePlay(_:)), for: .touchUpInside)
        mainView.greenButtonPressed.addTarget(self, action: #selector(gamePlay(_:)), for: .touchUpInside)
        mainView.playAgainButtonPressed.addTarget(self, action: #selector(playAgainButtonPressed), for: .touchUpInside)
    }
    
    func currentScoreGenerator() {
        score += 1
    }
    
    func highScoreGenerator() {
        score += 1
        if score >= highScore {
            highScore = score
            mainView.highScoreLabel.text = "  Your high score is \(highScore)"
            return
        }
    }
    
    @objc
    func gamePlay(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if mainView.colorGenerated.highestRGB() == mainView.colorGenerated.red {
                highScoreGenerator()
                mainView.colorGenerated = RGBValues()
                mainView.messageLabel.text = "You win! 🥳"
                mainView.scoreLabel.text = "  Your current score is \(score)"
                mainView.highScoreLabel.text = "  HighScore = \(highScore)"
                mainView.randomColorImageDisplay.backgroundColor = mainView.colorGenerated.rgbColor()
            } else {
                mainView.messageLabel.text = "Loser!😢"
                mainView.playAgainButtonPressed.isHidden = false
                [mainView.redButtonPressed, mainView.blueButtonPressed, mainView.greenButtonPressed].forEach({$0?.isEnabled = false})
            }
            
        case 1:
            if mainView.colorGenerated.highestRGB() == mainView.colorGenerated.blue {
                highScoreGenerator()
                mainView.colorGenerated = RGBValues()
                mainView.messageLabel.text = "You win! 🥳"
                mainView.scoreLabel.text = "  Your current score is \(score)"
                mainView.highScoreLabel.text = "  HighScore = \(highScore)"
                mainView.randomColorImageDisplay.backgroundColor = mainView.colorGenerated.rgbColor()
            } else {
                mainView.messageLabel.text = "Loser!😢"
                mainView.playAgainButtonPressed.isHidden = false
                [mainView.redButtonPressed, mainView.blueButtonPressed, mainView.greenButtonPressed].forEach({$0?.isEnabled = false})
            }
            
        case 2:
            if mainView.colorGenerated.highestRGB() == mainView.colorGenerated.green {
                highScoreGenerator()
                mainView.colorGenerated = RGBValues()
                mainView.messageLabel.text = "You win! 🥳"
                mainView.scoreLabel.text = "  Your current score is \(score)"
                mainView.highScoreLabel.text = "  HighScore = \(highScore)"
                mainView.randomColorImageDisplay.backgroundColor = mainView.colorGenerated.rgbColor()
            } else {
                mainView.messageLabel.text = "Loser!😢"
                mainView.playAgainButtonPressed.isHidden = false
                [mainView.redButtonPressed, mainView.blueButtonPressed, mainView.greenButtonPressed].forEach({$0?.isEnabled = false})
                mainView.playAgainButtonPressed.isHidden = false
            }
            
        default:
            mainView.playAgainButtonPressed.isHidden = false
            print("not found")
        }
    }
    
        @objc
        func playAgainButtonPressed() {
            score = 0
            mainView.playAgainButtonPressed.isHidden = true
            mainView.playAgainButtonPressed.setTitle("Play Again?", for: .normal)
            [mainView.redButtonPressed, mainView.blueButtonPressed, mainView.greenButtonPressed].forEach({$0?.isEnabled = true})
            mainView.colorGenerated = RGBValues()
            mainView.randomColorImageDisplay.backgroundColor = mainView.colorGenerated.rgbColor()
            mainView.scoreLabel.text = "  Your current score is \(score)"
            mainView.highScoreLabel.text = "  Your high score is \(highScore)"
        }
}
