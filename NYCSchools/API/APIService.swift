//
//  APIService.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation

enum APIError: Error {
  case networkingError(Error)
  case serverError // HTTP 5xx
  case requestError(Int, String) // HTTP 4xx
  case invalidError
  case decodingError(DecodingError)
  
}

protocol APIService {
  func fetch(_ request: URLRequest, _ completion: @escaping (Result<Data, APIError>) -> Void)
}

/// School list - /s3k6-pzi2.json
/// School details - /f9bf-2cp4.json

struct NYCSchoolAPIService: APIService {

  let session: URLSession
  private let baseURL = "https://data.cityofnewyork.us/resource"
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func fetchSchools(_ completion: @escaping (Result<NYCSchoolList, APIError>) -> Void) {
    let urlString = "\(baseURL)/s3k6-pzi2.json"
    guard let url = URL(string: urlString) else { return }
    let urlRequest = URLRequest(url: url)
    self.fetch(urlRequest) { (result) in
      switch result {
      case .success(let data):
        // Successfully fetched Data. Parse using JSONDecoder
        do {
          let responseObject = try JSONDecoder().decode(NYCSchoolList.self, from: data)
          print("school 1 : \(responseObject.list[0])")
          print("school 2 : \(responseObject.list[1])")
          print("school 3 : \(responseObject.list[2])")
          DispatchQueue.main.async {
            completion(.success(responseObject))
          }
        } catch {
          // Received Decoding Error. Deliver error completion
          guard let decodingError = error as? DecodingError else { return }
          DispatchQueue.main.async {
            completion(.failure(.decodingError(decodingError)))
          }
        }
      case .failure(let error):
        DispatchQueue.main.async {
          completion(.failure(error))
        }
      }
    }
  }
  
  func fetch(_ request: URLRequest, _ completion: @escaping (Result<Data, APIError>) -> Void) {
    let task = session.dataTask(with: request) { (data, response, error) in
      if let error = error {
        completion(.failure(.networkingError(error)))
      }
      guard let http = response as? HTTPURLResponse, let data = data else {
        completion(.failure(.invalidError))
        return
      }
      
      switch http.statusCode {
      
      case 200:
        completion(.success(data))
        print("success")
        
      case 400...499:
        let body = String(data: data, encoding: .utf8)
        completion(.failure(.requestError(http.statusCode, body ?? "<no body>")))
        print("failure")
        
      case 500...599:
        completion(.failure(.serverError))
        
      default:
        fatalError("Unhandled HTTP Status Code: \(http.statusCode)")
      }
    }
    task.resume()
  }
}

struct NYCSchoolList: Decodable {
  let list: [NYCSchool]
}

struct NYCSchool: Decodable {
  let databaseNumber: String
  let schoolName: String
  
  private enum CodingKeys: String, CodingKey {
    case databaseNumber = "dba"
    case schoolName = "school_name"
  }
}
