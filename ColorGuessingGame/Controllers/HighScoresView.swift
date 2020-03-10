//
//  HighScoresView.swift
//  ColorGuessingGame
//
//  Created by Melinda Diaz on 3/10/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import UIKit

class HighScoresView: UIView {
    //TODO: Fix scrollView
    public lazy var backgroundImage: UIImageView = {
        var background = UIImageView()
        background.image = UIImage(named: "unicornDab")
        return background
    }()
    
    public lazy var highScoreLabel: UILabel = {
        let label = UILabel() //Remember this label initialize
        label.text = "HighScores"
        label.textAlignment = .center
        label.font = UIFont(name: "Chalkduster", size: 32)
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.backgroundColor = .systemTeal
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        return label
    }()
    
    public lazy var highScoresScrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
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
    
    
}
