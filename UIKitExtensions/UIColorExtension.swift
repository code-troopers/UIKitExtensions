//
//  UIColorExtension.swift
//  application
//
//  Created by Nicolas LELOUP on 13/07/2015.
//  Copyright © 2015 Nicolas LELOUP - Buzznative. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
  /**
   Gives a random UIColor.
   
   - Returns: UIColor
   */
  public static func randomColor() -> UIColor {
    return UIColor(red: CGFloat(randomFloat(0, upper: 255.0)) / 255.0, green: CGFloat(randomFloat(0, upper: 255.0)) / 255.0, blue: CGFloat(randomFloat(0, upper: 255.0)) / 255.0, alpha: 1)
  }
  
  /**
   Generates a random Float between a lower and an upper values.
   
   - Parameters:
      - lower: the lower value
      - upper: the lower value
   
   - Returns: UIColor
   */
  private static func randomFloat(lower: Float = 0.0, upper: Float = 1.0) -> Float {
    let r = Float(arc4random()) / Float(UInt32.max)
    return (r * (upper - lower)) + lower
  }
  
  /**
   Formats a hex color string to UIColor. If empty, Black. If invalid, White.
   
   - Parameter hex: web format hex color without the #
   
   - Returns: UIColor
   */
  public static func colorFromHex(hex: String) -> UIColor {
    let scanner = NSScanner(string: hex)
    scanner.charactersToBeSkipped = NSCharacterSet.alphanumericCharacterSet().invertedSet
    
    var value: UInt32 = 0;
    scanner.scanHexInt(&value)
    
    let red = CGFloat(Float(Int(value >> 16) & 0x000000FF) / 255.0)
    let green = CGFloat(Float(Int(value >> 8) & 0x000000FF) / 255.0)
    let blue = CGFloat(Float(Int(value) & 0x000000FF) / 255.0)
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
  }
}
