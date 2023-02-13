//
//  NYCSchoolSATScores.swift
//  NYCSchools
//
//  Created by Dhruvil Vyas on 2/12/23.
//

import Foundation

struct NYCSchoolSATScores {
  var databaseNumber: String
  let schoolName: String
  let avgCriticalReadingScore: String
  let avgMathScore: String
  let avgWritingScore: String
  let testTakerCount: String
}

extension NYCSchoolSATScores {
  init(response: NYCSchoolAPIService.NYCSchoolSATScoresAPIResponse) {
    self.init(
      databaseNumber: response.databaseNumber,
      schoolName: response.schoolName,
      avgCriticalReadingScore: response.averageCriticalReadingScore,
      avgMathScore: response.averageMathScore,
      avgWritingScore: response.averageWritingScore,
      testTakerCount: response.testTakerCount
    )
  }
}
