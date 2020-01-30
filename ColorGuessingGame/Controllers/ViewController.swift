//
//  ViewController.swift
//  ColorGuessingGame
//
//  Created by Melinda Diaz on 1/28/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var highScore = 0
    
    //need a private instance of MainView
    private var mainView = MainView()
    
    //var buttonsArray = [mainView.greenButtonPressed, mainView.redButtonPressed, mainView.blueButtonPressed]
    override func loadView() {
        view = mainView //You need this to load everything you put on the mainview file to this ViewController
        //self.showAlert(title: "Rules For Color Guessing Game", message: "A random color appears on the screen. Tap the color that it most closely resembles. ")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activateTargetGamePlay()
        self.showAlert(title: "Rules For Color Guessing Game", message: "A random color appears on the screen. Tap the color that it most closely resembles. ")
        
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
            mainView.highScoreLabel.text = "Your high score is \(highScore)"
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
                mainView.scoreLabel.text = "Your current score is \(score)"
                mainView.highScoreLabel.text = "HighScore = \(highScore)"
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
                mainView.scoreLabel.text = "Your current score is \(score)"
                mainView.highScoreLabel.text = "HighScore = \(highScore)"
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
                mainView.scoreLabel.text = "Your current score is \(score)"
                mainView.highScoreLabel.text = "HighScore = \(highScore)"
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
            mainView.scoreLabel.text = "Your current score is \(score)"
            mainView.highScoreLabel.text = "Your high score is \(highScore)"
        }


}
