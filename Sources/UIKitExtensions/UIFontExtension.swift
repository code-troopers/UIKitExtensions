//
//  UIFontExtension.swift
//  
//
//  Created by Nicolas LELOUP on 19/08/2015.
//
//

import UIKit

public extension UIFont {
  /**
   Gives the UIFont for the given font name and font size
   
   - Parameters:
      - customFontName: The name of your font
      - ofSize: The size of your font you want
   
   - Return: UIFont
   */
  static func fontNamed(_ customFontName: String, ofSize fontSize: CGFloat) -> UIFont {
    return UIFont(name: customFontName, size: fontSize)!
  }
}
