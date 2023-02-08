//
//  SchoolListViewModel.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation


struct NYCSchoolListViewModel {
  let apiService: NYCSchoolAPIService
  
  init(apiService: NYCSchoolAPIService) {
    self.apiService = apiService
    fetchData()
  }
  
  func fetchData() {
    apiService.fetchSchools { result in
      switch result {
      case .success(let schoolList):
        for i in 0..<5 {
          print(schoolList[i])
        }
      default: break
      }
    }
  }
}
