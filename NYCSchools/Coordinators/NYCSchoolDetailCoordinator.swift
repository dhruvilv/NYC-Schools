//
//  NYCSchoolDetailCoordinator.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//


import UIKit

class NYCSchoolDetailCoordinator: Coordinator {
  
  let schoolInfo: NYCSchoolInfo
  let apiService: NYCSchoolAPIService
  var viewModel: NYCSchoolDetailViewModel
  var navigationController: UINavigationController
  
  init(
    schoolInfo: NYCSchoolInfo,
    apiService: NYCSchoolAPIService,
    navigationController: UINavigationController
  ) {
    self.schoolInfo = schoolInfo
    self.apiService = apiService
    self.viewModel = NYCSchoolDetailViewModel(schoolInfo: schoolInfo, apiService: apiService)
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = NYCSchoolDetailViewController(viewModel: viewModel)
    self.navigationController.pushViewController(vc, animated: true)
  }
}
