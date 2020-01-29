//
//  MainView.swift
//  ColorGuessingGame
//
//  Created by Melinda Diaz on 1/28/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//
import Foundation
import UIKit

class MainView: UIView {
    
    let defaultMessage = " Guess That Color!"
    var colorGenerated = RGBValues()
    
    
    
    public lazy var backgroundImage: UIImageView = {
        var background = UIImageView()
        background.image = UIImage(named: "unicornWallpaper")
        return background
    }()
    
    
    //This is the first message you see on the top
    public lazy var messageLabel: UILabel = {
        let label = UILabel() //Remember this label initialize
        label.text = defaultMessage
        label.textAlignment = .center
        label.font = UIFont(name: "Chalkduster", size: 32)
        label.textColor = .systemIndigo
        label.numberOfLines = 0
        label.backgroundColor = .systemTeal
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        label.alpha = 7 //fix this
        return label
    }() // Remember you need this
    
    public lazy var randomColorImageDisplay: UIView = {
        let image = UIView()
        image.backgroundColor = colorGenerated.rgbColor()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true 
        return image
    }()
    
    public lazy var highScoreLabel: UILabel = {
        let label = UILabel()
        label.text = " High Score = 0"
        label.textAlignment = .left
        label.font = UIFont(name: "Chalkduster", size: 17)
        label.textColor = .systemIndigo
        label.backgroundColor = .systemTeal
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.alpha = 3 //fix translution
        return label
    }()
    
    public lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = " Score = 0"
        label.textAlignment = .left
        label.font = UIFont(name: "Chalkduster", size: 17)
        label.textColor = .systemIndigo
        label.backgroundColor = .systemTeal
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.alpha = 3
        return label
    }()
    
    public lazy var redButtonPressed: UIButton = {
        let redButton = UIButton()
        redButton.backgroundColor = .systemRed
        redButton.layer.cornerRadius = 50
        redButton.clipsToBounds = true
        return redButton
    }()
    
    public lazy var blueButtonPressed: UIButton = {
        let blueButton = UIButton()
        blueButton.backgroundColor = .systemBlue
        blueButton.layer.cornerRadius = 50
        blueButton.clipsToBounds = true
        return blueButton
    }()
    
    public lazy var greenButtonPressed: UIButton = {
        let greenButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        greenButton.backgroundColor = .systemGreen
        greenButton.layer.cornerRadius = greenButton.frame.height / 2
        greenButton.clipsToBounds = true
        return greenButton
    }()
    
    public lazy var playAgainButtonPressed: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle(" Play Again? ", for: .normal)
        button.titleLabel?.textColor = .systemIndigo
        button.titleLabel?.font = UIFont(name: "Chalkduster", size: 12)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.isHidden = false
        return button
    }()
    
    //we use the override initializer to make the frame
    //init(frame:) gets called if view is dont programmatically
    override init(frame: CGRect) {
        super.init(frame:UIScreen.main.bounds)
        commonInit()
    }
    
    //required' initializer 'init(coder:)' must be provided by subclass of 'UIView'
    //So if this view gets initialized from storyboard this initializer gets called.
    //the ? is a fallable initializer if you don't have that it will fail GO back to unit 1 with initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpBackgroundImage()
        setUpMessageLabel()
        setUpRandomColorImageDisplay()
        setUpHighScoreLabel()
        setUpScoreLabel()
        setUpRedButton()
        setUpBlueButton()
        setUpGreenButton()
        setUpPlayAgainButton()
        //        showAlert(title: "Blah", message: "blah blah")
    }
    //use this to make the button into a circle
    override func layoutSubviews() {
        super.layoutSubviews()
        //greenButton.layer.cornerRadius = greenButton.frame.height / 2
    }
    
    //This sets up the background image constraints
    private func setUpBackgroundImage() {
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    //This sets up the messageLabel restraints
    private func setUpMessageLabel() {
        //add the messageLabel to the mainView
        addSubview(messageLabel) //returns the message label we created above
        //set constraints for the message label, when doing this you set autoresizing mask to off. addSubview means add a view to the existing view
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //You need this in order to constraint anything
        NSLayoutConstraint.activate([
            
            //set horizontal constraint top of MainView
            messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            // set some padding at the leading edge of the MainView
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            // set padding at the trailing edge of the MainView
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }
    
    //This sets up the randomColorImageDisplay constraints (I know its long)
    private func setUpRandomColorImageDisplay() {
        addSubview(randomColorImageDisplay) //returns the image we created above
        //set constraints for the image label, when doing this you set autoresizing mask to off. addSubview means add a view to the existing view
        randomColorImageDisplay.translatesAutoresizingMaskIntoConstraints = false
        
        //You need this in order to constraint anything
        NSLayoutConstraint.activate([
            randomColorImageDisplay.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            randomColorImageDisplay.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            randomColorImageDisplay.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            randomColorImageDisplay.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    //This sets up HighScore constraints
    private func setUpHighScoreLabel() {
        
        addSubview(highScoreLabel)
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highScoreLabel.topAnchor.constraint(equalTo: randomColorImageDisplay.bottomAnchor, constant: 8),
            highScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            highScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60)
        ])
        
    }
    
    //This sets up score constraints
    private func setUpScoreLabel() {
        addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: 8),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60)
        ])
    }
    
    //set up button constraints
    private func setUpRedButton() {
        addSubview(redButtonPressed)
        redButtonPressed.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
              redButtonPressed.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
              redButtonPressed.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
              redButtonPressed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -295),
            redButtonPressed.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.125),
         
        ])
    }
    
        private func setUpBlueButton() {
            addSubview(blueButtonPressed)
            blueButtonPressed.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                blueButtonPressed.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 100),
                blueButtonPressed.leadingAnchor.constraint(equalTo: redButtonPressed.trailingAnchor, constant: 60),
                blueButtonPressed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120),
                blueButtonPressed.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.125),
                 blueButtonPressed.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.125)
            
            ])
        }
    
    private func setUpGreenButton() {
        addSubview(greenButtonPressed)
        greenButtonPressed.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        // greenButtonPressed.topAnchor.constraint(equalTo: redButtonPressed.bottomAnchor, constant: 50),
         greenButtonPressed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
         //greenButtonPressed.trailingAnchor.constraint(equalTo: blueButtonPressed.leadingAnchor, constant: 60),
         greenButtonPressed.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:-40),
         greenButtonPressed.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.125),
            greenButtonPressed.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.125)
        
        
        ])
    }
    
    private func setUpPlayAgainButton() {
        addSubview(playAgainButtonPressed)
        playAgainButtonPressed.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playAgainButtonPressed.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            playAgainButtonPressed.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            playAgainButtonPressed.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 280),
            playAgainButtonPressed.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        
        ])
    }
    
}
