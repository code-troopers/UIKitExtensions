//
//  CustomView.swift
//  Pods
//
//  Created by Nicolas LELOUP on 31/08/2017.
//
//

import Foundation
import SnapKit
import UIKit

public protocol OwnViewProtocol {
  var viewName: String { get }
}

open class OwnView: UIView {
  var contentView: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.loadView()
  }
  
  required public init(coder: NSCoder) {
    super.init(coder: coder)!
    self.loadView()
  }
  
  open func loadView() {
    if let conformingProtocolView = self as? OwnViewProtocol {
      let bundle = Bundle(for: self.classForCoder)
      self.contentView = bundle.loadNibNamed(
        conformingProtocolView.viewName,
        owner: self,
        options: nil
        )?.last as? UIView
      self.addSubview(self.contentView)
      self.contentView.snp.makeConstraints({ (maker) in
        maker.edges.equalTo(self)
      })
    }
  }
}
