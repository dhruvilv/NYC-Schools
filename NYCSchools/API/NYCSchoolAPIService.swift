//
//  NYCSchoolAPIService.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/7/23.
//

import Foundation

struct NYCSchoolAPIService {
  
  private static let SchoolListJSON = "s3k6-pzi2.json"
  private static let SchoolDetailJSON = "f9bf-2cp4.json"

  let session: URLSession
  private let baseURL = "https://data.cityofnewyork.us/resource"
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func fetchSchools(_ completion: @escaping (Result<[NYCSchool], APIError>) -> Void) {
    let urlString = "\(baseURL)/\(NYCSchoolAPIService.SchoolListJSON)"
    guard let url = URL(string: urlString) else { return }
    let urlRequest = URLRequest(url: url)
    performFetch(urlRequest) { result in
      parseDecodable(result: result, completion: completion)
    }
  }
}

extension NYCSchoolAPIService: APIService {
  
  func performFetch(_ request: URLRequest, _ completion: @escaping (Result<Data, APIError>) -> Void) {
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
  
  func parseDecodable<T: Decodable>(result: Result<Data, APIError>, completion: @escaping ResultCompletion<T>) {
    switch result {
    case .success(let data):
      // Successfully fetched Data. Parse using JSONDecoder
      do {
        let responseObject = try JSONDecoder().decode(T.self, from: data)
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

  struct NYCSchool: Decodable {
    let databaseNumber: String
    let schoolName: String
    
    private enum CodingKeys: String, CodingKey {
      case databaseNumber = "dbn"
      case schoolName = "school_name"
    }
  }
}


