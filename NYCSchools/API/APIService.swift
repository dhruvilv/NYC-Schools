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

typealias DataResult = Result<Data, APIError>
typealias DataCompletion = (DataResult) -> Void
typealias ResultCompletion<T: Decodable> = (Result<T, APIError>) -> Void

// Usually, just the one method `performFetch` should be enough for an API service for a project
// of this simplicity. I just wanted to showcase some usage of Generics so I have split the
// data fetching into 2 parts.

protocol APIService {
  var session: URLSession { get }
  func performFetch(_ request: URLRequest, _ completion: @escaping DataCompletion)
  func parseDecodable<T: Decodable>(result: DataResult, completion: @escaping ResultCompletion<T>)
}

extension APIService {
  
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
}
