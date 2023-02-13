//
//  LoadingView.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//

import UIKit

protocol LoadingView {
  var spinner: UIActivityIndicatorView { get }
  func startAnimating()
  func stopAnimating()
}

extension LoadingView where Self: UIViewController {
    
  func startAnimating() {
    spinner.startAnimating()
  }
  
  func stopAnimating() {
    spinner.stopAnimating()
  }
}
