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
  
  func fadeInNowWithCallback(completion: AnimationCompletionBlock?) {
    UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
      self.alpha = 1.0
      }, completion: completion)
  }
  
  func fadeOutNowWithCallback(completion: AnimationCompletionBlock?) {
    UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
      self.alpha = 0.0
      }, completion: completion)
  }
  
  func flash() {
    UIView.animateWithDuration(0.1, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
      self.alpha = 1
      }) { (param) -> Void in
        UIView.animateWithDuration(0.1, delay: 0, options: .CurveEaseOut, animations: {
          self.alpha = 0
          }, completion: nil)
    }
  }
  
  // MARK: Resizing animations
  func resizeWithFactor(factor: CGFloat) {
    self.resizeWithFactor(factor, completion: nil)
  }
  
  func resizeWithFactor(factor: CGFloat, completion: AnimationCompletionBlock?) {
    let currentFrame = self.frame
    let width = currentFrame.size.width * factor
    let height = currentFrame.size.height * factor
    let leftOffset = (currentFrame.origin.x + (currentFrame.size.width * (1.0 - factor))) / 2
    let topOffset = (currentFrame.origin.y + (currentFrame.size.height * (1.0 - factor))) / 2
    let newFrame : CGRect = CGRectMake(leftOffset, topOffset, width, height)
    
    UIView.animateWithDuration(0.4, delay: 0, options: .CurveEaseOut, animations: {
      self.frame = newFrame
      }, completion: completion)
  }
  
  // MARK: Sliding animations
  func slideUp() {
    self.slideUp(nil)
  }
  
  func slideUp(completion: ((Bool) -> Void)?) {
    let screenBound = UIScreen.mainScreen().bounds
    let currentFrame = self.frame
    let newFrame : CGRect = CGRectMake(currentFrame.origin.x, currentFrame.origin.y - screenBound.size.height, currentFrame.size.width, currentFrame.size.height)
    UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut, animations: {
      self.frame = newFrame
      }, completion: completion)
  }
  
  func slideDown() {
    self.slideDown(nil)
  }
  
  func slideDown(completion: ((Bool) -> Void)?) {
    let screenBound = UIScreen.mainScreen().bounds
    let currentFrame = self.frame
    let newFrame : CGRect = CGRectMake(currentFrame.origin.x, currentFrame.origin.y + screenBound.size.height, currentFrame.size.width, currentFrame.size.height)
    UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut, animations: {
      self.frame = newFrame
      }, completion: completion)
  }
}

