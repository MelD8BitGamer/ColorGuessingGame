//
//  MainView.swift
//  ColorGuessingGame
//
//  Created by Melinda Diaz on 1/28/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

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
        label.textColor = .systemRed
        label.numberOfLines = 0
        return label
    }() // Remember you need this
    
    public lazy var randomColorImageDisplay: UIView = {
        let image = UIView()
        image.backgroundColor = .red//colorGenerated.rgbColor()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true 
        return image
        print("")
    }()
    
    //we use the override initializer to make the frame
    //init(frame:) gets called if view is donr programmatically
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
    }
    
    //This sets up the image constraints
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
            randomColorImageDisplay.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4),
            randomColorImageDisplay.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        ])
    }
}
