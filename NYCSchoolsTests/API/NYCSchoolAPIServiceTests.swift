//
//  NYCSchoolAPIService.swift
//  NYCSchoolsTests
//
//  Created by Dhruvil Vyas on 2/13/23.
//

import XCTest
@testable import NYCSchools

class NYCSchoolAPIServiceTests: XCTestCase {
  
    var apiService: NYCSchoolAPIService!

    override func setUpWithError() throws {
        apiService = NYCSchoolAPIService()
    }

    override func tearDownWithError() throws {}
  
    func test_fetchSchool_returnsOnMainThread() {
        let exp = expectation(description: "API Result received")
        apiService.fetchSchools() { result in
            exp.fulfill()
            XCTAssert(Thread.isMainThread)
        }
        wait(for: [exp], timeout: 3.0)
    }
    
    func test_fetchSchool_fetchesDataSuccessfully() {
        let exp = expectation(description: "API Result received")
        apiService.fetchSchools { result in
            switch result {
            case .success(let schoolList):
                exp.fulfill()
                guard let school = schoolList.first else {
                    XCTFail("Unable to fetch Results")
                    return
                }
                XCTAssertEqual("Clinton School Writers & Artists, M.S. 260", school.schoolName)
                XCTAssertEqual("02M260", school.databaseNumber)
            default:
                XCTFail("Got error instead.")
            }
        }
        wait(for: [exp], timeout: 3.0)
    }
    
    func test_fetchSATScores_returnsOnMainThread() {
        let exp = expectation(description: "API Result received")
        apiService.fetchSATScores() { result in
            exp.fulfill()
            XCTAssert(Thread.isMainThread)
        }
        wait(for: [exp], timeout: 3.0)
    }
    
    func test_fetchSATScores_fetchesDataSuccessfully() {
        let exp = expectation(description: "API Result received")
        apiService.fetchSATScores { result in
            switch result {
            case .success(let schoolSATList):
                exp.fulfill()
                XCTAssertTrue(schoolSATList.count > 0)
            default:
                XCTFail("Got error instead.")
            }
        }
        wait(for: [exp], timeout: 3.0)
    }
    

}
