//
//  SchoolListViewModel.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation

enum Status {
  case loading
  case loaded
  case error
}


class NYCSchoolListViewModel {
  
  // MARK: - Properties
  
  let apiService: NYCSchoolAPIService
  
  var schools: [NYCSchoolInfo]?
  
  var status: Observable<Status> = Observable(value: .loading)
  
  var showSchoolDetailInfo: ((NYCSchoolInfo) -> Void)?
  
  
  // MARK: - Initializer
  
  init(apiService: NYCSchoolAPIService) {
    self.apiService = apiService
    fetchSchools()
  }
  
  // MARK: - Methods
  
  func didTapSchool(at index: Int) {
    guard let schools = schools, index < schools.count else { return }
    let schoolViewModel = schools[index]
    showSchoolDetailInfo?(schoolViewModel)
  }
  
  func fetchSchools() {
    apiService.fetchSchools { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let schoolList):
        self.schools = schoolList.compactMap(NYCSchoolInfo.init)
        self.status.value = .loaded
      default:
        // TODO: We can have some error handling here by showing an Error screen or throwing an alert.
        // It really depends on the flow design.
        self.status.value = .error
        break
      }
    }
  }
}
