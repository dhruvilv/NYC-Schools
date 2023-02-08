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
  func performFetch(_ request: URLRequest, _ completion: @escaping DataCompletion)
  func parseDecodable<T: Decodable>(result: DataResult, completion: @escaping ResultCompletion<T>)
}
