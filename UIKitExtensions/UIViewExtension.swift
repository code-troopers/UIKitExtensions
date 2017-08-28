//
//  UIViewExtension.swift
//  application
//
//  Created by Nicolas LELOUP on 02/09/2015.
//  Copyright (c) 2015 Nicolas LELOUP - Buzznative. All rights reserved.
//

import Foundation
import UIKit

typealias AnimationCompletionBlock = ((Bool) -> Void)

extension UIView {
  // MARK: Fading animations
  func fadeInNow() {
    self.fadeInNowWithCallback(nil)
  }
  
  func fadeOutNow() {
    self.fadeOutNowWithCallback(nil)
  }
  
  func fadeInNowWithCallback(_ completion: AnimationCompletionBlock?) {
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
      self.alpha = 1.0
      }, completion: completion)
  }
  
  func fadeOutNowWithCallback(_ completion: AnimationCompletionBlock?) {
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
      self.alpha = 0.0
      }, completion: completion)
  }
  
  func flash() {
    UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: { () -> Void in
      self.alpha = 1
      }) { (param) -> Void in
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
          self.alpha = 0
          }, completion: nil)
    }
  }
  
  // MARK: Resizing animations
  func resizeWithFactor(_ factor: CGFloat) {
    self.resizeWithFactor(factor, completion: nil)
  }
  
  func resizeWithFactor(_ factor: CGFloat, completion: AnimationCompletionBlock?) {
    let currentFrame = self.frame
    let width = currentFrame.size.width * factor
    let height = currentFrame.size.height * factor
    let leftOffset = (currentFrame.origin.x + (currentFrame.size.width * (1.0 - factor))) / 2
    let topOffset = (currentFrame.origin.y + (currentFrame.size.height * (1.0 - factor))) / 2
    let newFrame : CGRect = CGRect(x: leftOffset, y: topOffset, width: width, height: height)
    
    UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
      self.frame = newFrame
      }, completion: completion)
  }
  
  // MARK: Sliding animations
  func slideUp() {
    self.slideUp(nil)
  }
  
  func slideUp(_ completion: ((Bool) -> Void)?) {
    let screenBound = UIScreen.main.bounds
    let currentFrame = self.frame
    let newFrame : CGRect = CGRect(x: currentFrame.origin.x, y: currentFrame.origin.y - screenBound.size.height, width: currentFrame.size.width, height: currentFrame.size.height)
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
      self.frame = newFrame
      }, completion: completion)
  }
  
  func slideDown() {
    self.slideDown(nil)
  }
  
  func slideDown(_ completion: ((Bool) -> Void)?) {
    let screenBound = UIScreen.main.bounds
    let currentFrame = self.frame
    let newFrame : CGRect = CGRect(x: currentFrame.origin.x, y: currentFrame.origin.y + screenBound.size.height, width: currentFrame.size.width, height: currentFrame.size.height)
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
      self.frame = newFrame
      }, completion: completion)
  }
}

