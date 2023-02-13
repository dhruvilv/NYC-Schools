//
//  NYCSchoolListCoordinator.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation
import UIKit

class NYCSchoolListCoordinator: Coordinator {
  
  let apiService: NYCSchoolAPIService
  let viewModel: NYCSchoolListViewModel
  var navigationController: UINavigationController
  
  init(
    apiService: NYCSchoolAPIService,
    navigationController: UINavigationController
  ) {
    self.apiService = apiService
    self.viewModel = NYCSchoolListViewModel(apiService: apiService)
    self.navigationController = navigationController
    viewModel.selectedSchool.subscribe { schoolInfo in
      guard let schoolInfo = schoolInfo else { return }
      self.startSchoolDetailCoordinator(schoolInfo)
    }
  }
  
  func startSchoolDetailCoordinator(_ school: NYCSchoolInfo) {
    let coordinator = NYCSchoolDetailCoordinator(
      schoolInfo: school,
      apiService: apiService,
      navigationController: navigationController
    )
    coordinator.start()
  }
  
  func start() {
    let vc = NYCSchoolListViewController(viewModel: viewModel)
    self.navigationController.pushViewController(vc, animated: true)
  }
}
