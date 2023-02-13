//
//  NYCSchoolInfo.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//

import Foundation

struct NYCSchoolInfo {
  let name: String
  let databaseNumber: String
}

extension NYCSchoolInfo {
  init(response: NYCSchoolAPIService.NYCSchoolListAPIResponse) {
    self.init(name: response.schoolName, databaseNumber: response.databaseNumber)
  }
}
