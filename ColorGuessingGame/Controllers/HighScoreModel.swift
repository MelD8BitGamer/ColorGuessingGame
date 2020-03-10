//
//  HighScoreModel.swift
//  ColorGuessingGame
//
//  Created by Melinda Diaz on 3/10/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation

struct HighScoresList: Codable & Equatable {
    let name: String
    let highScore: Int
    let date: Date
}
