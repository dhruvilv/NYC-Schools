//
//  UITableView+.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import UIKit

extension UITableView {
  func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T {
    let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath)
    return cell as! T
  }
}

