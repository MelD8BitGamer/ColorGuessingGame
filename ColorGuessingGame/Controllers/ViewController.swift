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
        
        // self.showAlert(title: "Rules For Color Guessing Game", message: "A random color appears on the screen. Tap the color that it most closely resembles. ")
        
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
    
    func playAgainButtonPressed() {
        score = 0
        mainView.playAgainButtonPressed.isHidden = true
        mainView.playAgainButtonPressed.setTitle("OK Try Again!", for: .normal)
        [mainView.redButtonPressed, mainView.blueButtonPressed, mainView.greenButtonPressed].forEach({$0?.isEnabled = true})
        mainView.colorGenerated = RGBValues()
        mainView.randomColorImageDisplay.backgroundColor = mainView.colorGenerated.rgbColor()
        mainView.scoreLabel.text = "Your current score is \(score)"
        mainView.highScoreLabel.text = "Your high score is \(highScore)"
    }
    
    func gamePlay() {
        switch mainView {
        case mainView.redButtonPressed:
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
            
        case mainView.blueButtonPressed:
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
                //you need to set a new game
            }
        case mainView.greenButtonPressed:
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
                
            }
        default:
            mainView.playAgainButtonPressed.isHidden = false
            print("not found")
        }
    }
}

