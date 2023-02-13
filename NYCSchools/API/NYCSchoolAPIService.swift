//
//  NYCSchoolAPIService.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation

struct NYCSchoolAPIService: APIService {
  
  private static let SchoolListJSON = "s3k6-pzi2.json"
  private static let SchoolDetailJSON = "f9bf-2cp4.json"

  var session: URLSession
  private let baseURL = "https://data.cityofnewyork.us/resource"
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func fetchSchools(_ completion: @escaping (Result<[NYCSchoolListAPIResponse], APIError>) -> Void) {
    let urlString = "\(baseURL)/\(NYCSchoolAPIService.SchoolListJSON)"
    guard let url = URL(string: urlString) else { return }
    let urlRequest = URLRequest(url: url)
    performFetch(urlRequest) { result in
      parseDecodable(result: result, completion: completion)
    }
  }
  
  func fetchSATScores(_ completion: @escaping (Result<[NYCSchoolSATScoresAPIResponse], APIError>) -> Void) {
    let urlString = "\(baseURL)/\(NYCSchoolAPIService.SchoolDetailJSON)"
    guard let url = URL(string: urlString) else { return }
    let urlRequest = URLRequest(url: url)
    performFetch(urlRequest) { result in
      parseDecodable(result: result, completion: completion)
    }
  }
  
  struct NYCSchoolListAPIResponse: Decodable {
    let databaseNumber: String
    let schoolName: String
    let phoneNumber: String
    let website: String
    //let email: String
    let addressLine1: String
    let city: String
    let zip: String
    let stateCode: String
    
    
    private enum CodingKeys: String, CodingKey {
      case databaseNumber = "dbn"
      case schoolName = "school_name"
      case phoneNumber = "phone_number"
      case website = "website"
      //case email = "school_email"
      case addressLine1 = "primary_address_line_1"
      case city = "city"
      case zip = "zip"
      case stateCode = "state_code"
    }
  }
  
  struct NYCSchoolSATScoresAPIResponse: Decodable {
    let databaseNumber: String
    let schoolName: String
    let testTakerCount: String
    let averageCriticalReadingScore: String
    let averageMathScore: String
    let averageWritingScore: String
    
    private enum CodingKeys: String, CodingKey {
      case databaseNumber = "dbn"
      case schoolName = "school_name"
      case testTakerCount = "num_of_sat_test_takers"
      case averageCriticalReadingScore = "sat_critical_reading_avg_score"
      case averageMathScore = "sat_math_avg_score"
      case averageWritingScore = "sat_writing_avg_score"
      
    }
  }
}


