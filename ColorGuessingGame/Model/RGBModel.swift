//
//  RGBModel.swift
//  ColorGuessingGame
//
//  Created by Melinda Diaz on 1/28/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation
import UIKit

struct RGBValues {
    let alpha = CGFloat(1)
    var red = CGFloat.random(in: 0...1)
    var green = CGFloat.random(in: 0...1)
    var blue = CGFloat.random(in: 0...1)
    
    func rgbColor() -> UIColor {
       return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func highestRGB() -> CGFloat {
        
        let sortedRGB = [red, green, blue].sorted(by:{$0 > $1})//this sorts everything and keeps the highest value as a 0.
        return sortedRGB[0]
    }
    
}
