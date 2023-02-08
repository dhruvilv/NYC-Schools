//
//  APIModels.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation

/// Note: We want to keep Models for Decodable Objects Separate from the ones we use in the
/// app. The advantage is that if the json format for any of these objects changes
/// then we have a single place to make the correction, thereby avoiding app-level changes

struct NYCSchool: Decodable {
  let databaseNumber: String
  let schoolName: String
  
  private enum CodingKeys: String, CodingKey {
    case databaseNumber = "dbn"
    case schoolName = "school_name"
  }
}
