//
//  NYCSchoolViewModel.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation


struct NYCSchoolViewModel {
  let databaseNumber: String
  let schoolName: String
}

extension NYCSchoolViewModel {
  init(response: NYCSchoolAPIService.NYCSchool) {
    self.init(databaseNumber: response.databaseNumber, schoolName: response.schoolName)
  }
}
