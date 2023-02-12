//
//  NYCSchoolListCoordinator.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation
import UIKit

class NYCSchoolListCoordinator: Coordinator {
  
  var navigationController: UINavigationController
  var viewModel: NYCSchoolListViewModel
  
  init(
    viewModel: NYCSchoolListViewModel,
    navigationController: UINavigationController
  ) {
    self.viewModel = viewModel
    self.navigationController = navigationController
    viewModel.showSchoolDetailInfo = { [weak self] school in
      self?.startSchoolDetailCoordinator(school)
    }
  }
  
  func startSchoolDetailCoordinator(_ school: NYCSchoolDetailViewModel) {
    let viewModel = school
    let coordinator = NYCSchoolDetailCoordinator(
      viewModel: viewModel,
      navigationController: navigationController
    )
    coordinator.start()
  }
  
  func start() {
    let vc = NYCSchoolListViewController(viewModel: viewModel)
    self.navigationController.pushViewController(vc, animated: true)
  }
}
