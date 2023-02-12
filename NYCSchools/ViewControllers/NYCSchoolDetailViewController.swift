//
//  NYCSchoolDetailViewController.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import UIKit

class NYCSchoolDetailViewController: UIViewController {
  
  let schoolName: String
  
  init(schoolName: String) {
    self.schoolName = schoolName
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = schoolName
    view.backgroundColor = .systemGreen
  }
}