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
  let apiService: NYCSchoolAPIService
  
  var schools: [NYCSchoolViewModel]?
  
  var status: Status = .loading {
    didSet {
      statusDidChange?(status)
    }
  }
  
  var statusDidChange: ((Status) -> Void)?
  
  init(apiService: NYCSchoolAPIService) {
    self.apiService = apiService
    fetchData()
  }
  
  func fetchData() {
    apiService.fetchSchools { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let schoolList):
        self.schools = schoolList.compactMap(NYCSchoolViewModel.init)
        self.status = .loaded
      default:
        // TODO: We can have some error handling here by showing an Error screen or throwing an alert.
        // It really depends on the flow design.
        self.status = .error
        break
      }
    }
  }
}
