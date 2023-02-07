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

struct SchoolList: Decodable {}
