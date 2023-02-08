//
//  APIModels.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation

struct NYCSchool: Decodable {
  let databaseNumber: String
  let schoolName: String
  
  private enum CodingKeys: String, CodingKey {
    case databaseNumber = "dbn"
    case schoolName = "school_name"
  }
}
