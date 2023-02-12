//
//  Observable.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//

import Foundation

// NOTE: For more complex streams of data, we can use Reactive frameworks like RxSwift or Combine which also provide better tools for memory management with closure.  But for the purpose of our project, this implementation is sufficient.

class Observable<T> {
  
  // MARK: - Private methods
  private var subscribers: [(T) -> Void] = []
  
  // MARK: - Public methods
  var value: T {
    didSet {
      // We call all the listeners
      subscribers.forEach { $0(value) }
    }
  }
  
  // MARK: - Initialization
  init(value: T) {
    self.value = value
  }
    
  func subscribe(_ closure: @escaping (T) -> Void) {
    subscribers.append(closure)
  }
}
