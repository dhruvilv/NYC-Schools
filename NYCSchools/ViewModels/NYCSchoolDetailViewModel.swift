//
//  NYCSchoolDetailViewModel.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation

class NYCSchoolDetailViewModel {
  
  let apiService: NYCSchoolAPIService
  let schoolInfo: NYCSchoolInfo
  var satScoreInfo: NYCSchoolSATScores?
  
  // MARK: - Initializers
  
  init(schoolInfo: NYCSchoolInfo, apiService: NYCSchoolAPIService) {
    self.schoolInfo = schoolInfo    
    self.apiService = apiService
    apiService.fetchSATScores { [weak self] result in
      switch result {
      case .success(let scoreList):
        self?.satScoreInfo = scoreList
          .compactMap(NYCSchoolSATScores.init)
          .filter { $0.databaseNumber == self?.schoolInfo.databaseNumber }
          .first
      case .failure(_):
        //TODO: Error case. Update UI with Error message.
        break
        
      }
    }
  }
}
