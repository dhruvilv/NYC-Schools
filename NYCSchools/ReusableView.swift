//
//  ReusableView.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import UIKit

protocol ReusableView {
  static var reuseIdentifier: String { get }
}

extension ReusableView {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

extension UITableViewCell: ReusableView {}
