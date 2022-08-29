//
//  UIColor+Extensions.swift
//  Teste
//
//  Created by Rafael Carvalho on 26/08/22.
//

import Foundation
import UIKit

extension UIColor {
    
    static func randomColor() -> UIColor {
        UIColor(
            displayP3Red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1),
            alpha: 1
        )
    }
    
}
