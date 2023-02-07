//
//  SchoolListViewModel.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation


struct SchoolListViewModel {
  let apiService: NYCSchoolAPIService
  
  init(apiService: NYCSchoolAPIService) {
    self.apiService = apiService
    fetchData()
  }
  
  func fetchData() {
    apiService.fetchSchools { result in
      
    }
  }
}
