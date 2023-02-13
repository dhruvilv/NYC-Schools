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
  
  var sections: [String] = ["Name", "Address", "Website", "Phone Number", "GPA Scores"]
  
  // MARK: - Initializers
  
  init(schoolInfo: NYCSchoolInfo, apiService: NYCSchoolAPIService) {
    self.schoolInfo = schoolInfo    
    self.apiService = apiService
    
    
    // MARK: - API
    /// NOTE: I don't like the fact that we cannot fetch the SAT score based off a school `databaseNumber`
    /// which would fetch us a single object since we already have the databaseNumber at hand. There might
    /// be such an API, but atleast I was not able to find it. Nevertheless, we fetch SAT scores for all
    /// the schools and filter out the respones.
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
