//
//  NYCSchoolDetailCoordinator.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//


import UIKit

class NYCSchoolDetailCoordinator: Coordinator {
  
  var navigationController: UINavigationController
  var viewModel: NYCSchoolDetailViewModel
  
  init(
    viewModel: NYCSchoolDetailViewModel,
    navigationController: UINavigationController
  ) {
    self.viewModel = viewModel
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = NYCSchoolDetailViewController(viewModel: viewModel)
    self.navigationController.pushViewController(vc, animated: true)
  }
}
