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
  
  private(set) var status: Observable<Status> = Observable(value: .loading)
  
  // MARK: - Computed Properties
  
  var sections: [String] = ["Name", "Address", "Phone", "Website", "SAT Scores"]
  
  var schoolName: String {
    schoolInfo.name
  }
  
  var phoneNumber: String {
    schoolInfo.phoneNumber
  }
  
  var website: String {
    schoolInfo.website
  }
  
  var formattedAddress: String {
    "\(schoolInfo.addressLine1)\n\(schoolInfo.city), \(schoolInfo.stateCode) \(schoolInfo.zip)"
  }
  
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
        self?.status.value = .loaded
      case .failure(_):
        //TODO: Error case. Update UI with Error message.
        self?.status.value = .error
        break
        
      }
    }
  }
}
