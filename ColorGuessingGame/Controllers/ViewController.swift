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
    
    override func loadView() {
        view = mainView //You need this to load everything you put on the mainview file to this ViewController
        //self.showAlert(title: "Rules For Color Guessing Game", message: "A random color appears on the screen. Tap the color that it most closely resembles. ")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
       // self.showAlert(title: "Rules For Color Guessing Game", message: "A random color appears on the screen. Tap the color that it most closely resembles. ")
        
    }

}

