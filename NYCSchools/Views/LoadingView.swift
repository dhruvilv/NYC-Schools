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
