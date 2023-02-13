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
  let phoneNumber: String
  let website: String
  let email: String
  let addressLine1: String
  let city: String
  let zip: String
  let stateCode: String
}


extension NYCSchoolInfo {
  init(response: NYCSchoolAPIService.NYCSchoolListAPIResponse) {
    self.init(
      name: response.schoolName,
      databaseNumber: response.databaseNumber,
      phoneNumber: response.phoneNumber,
      website: response.website,
      email: response.email,
      addressLine1: response.addressLine1,
      city: response.city,
      zip: response.zip,
      stateCode: response.stateCode
    )
  }
}
