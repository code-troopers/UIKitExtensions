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
  class func random() -> UIColor {
    return UIColor(red: randomFloat()/255, green: randomFloat()/255, blue: randomFloat()/255, alpha: 1)
  }
  
  private class func randomFloat() -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * 255
  }
  
  /**
   Formats a hex color string to UIColor.
   
   - Parameter hex: web format hex color without the #
   
   - Returns: UIColor
   */
    convenience init?(hexString: String) {
    let r, g, b, a: CGFloat
    
    if hexString.hasPrefix("#") {
      let start = hexString.index(hexString.startIndex, offsetBy: 1)
      let hexColor = hexString[start...]
      
      if hexColor.count == 8 {
        let scanner = Scanner(string: String(hexColor))
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255
          
          self.init(red: r, green: g, blue: b, alpha: a)
          return
        }
      }
    }
    
    return nil
  }
}
