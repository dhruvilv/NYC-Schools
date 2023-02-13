//
//  NYCSchoolDetailViewModel.swift
//  NYCSchoolsTests
//
//  Created by Dhruvil Vyas on 2/13/23.
//

import XCTest
@testable import NYCSchools

typealias Response = NYCSchoolAPIService.NYCSchoolSATScoresAPIResponse

class NYCSchoolDetailViewModelTests: XCTestCase {
    
    var viewModel: NYCSchoolDetailViewModel!
    var apiService: MockNYCSchoolAPIService!
    var schoolInfo: NYCSchoolInfo!

    override func setUpWithError() throws {
        apiService = MockNYCSchoolAPIService()
        schoolInfo = NYCSchoolInfo(
            name: "Women's Academy of Excellence",
            databaseNumber: "08X282",
            phoneNumber: "718-542-0740",
            website: "schools.nyc.gov/SchoolPortals/08/X282",
            addressLine1: "456 White Plains Road",
            city: "Bronx",
            zip: "10473",
            stateCode: "NY"
        )
        viewModel = NYCSchoolDetailViewModel(schoolInfo: schoolInfo, apiService: apiService)
    }
    
    func test_schoolInfo_onInit() {
        XCTAssertEqual(viewModel.schoolName, "Women's Academy of Excellence")
        XCTAssertEqual(viewModel.formattedAddress, "456 White Plains Road\nBronx, NY 10473" )
        XCTAssertEqual(viewModel.phoneNumber, "718-542-0740")
        XCTAssertEqual(viewModel.website, "schools.nyc.gov/SchoolPortals/08/X282")
    }
    
    func test_status_isLoadingOnInit() {
        XCTAssertEqual(viewModel.status.value, .loading)
    }
    
    func test_status_isLoadedOnAPIFetchSuccess() {
        apiService.completeWithSuccess()
        XCTAssertEqual(viewModel.status.value, .loaded)
    }
    
    func test_status_isErrorOnAPIFetchFailure() {
        apiService.completeWithFailure()
        XCTAssertEqual(viewModel.status.value, .error)
    }
    
    func test_SAT_Scores_areLoadedOnAPIFetchSuccess() {
        XCTAssertNil(viewModel.satScoreInfo)
        apiService.completeWithSuccess()
        XCTAssertNotNil(viewModel.satScoreInfo)
    }
    
    func test_SAT_Scores_areNilOnAPIFetchFailure() {
        apiService.completeWithFailure()
        XCTAssertNil(viewModel.satScoreInfo)
    }
    
    func test_fetchSATScores_isCalledExactlyOnce() {
        XCTAssertEqual(apiService.messages.count, 1)
    }
    
    override func tearDownWithError() throws {}
}

class MockNYCSchoolAPIService: NYCSchoolAPIService {
    
    var messages: [((Result<[Response], APIError>) -> Void)] = []
    
    let mockSATScore = NYCSchoolAPIService.NYCSchoolSATScoresAPIResponse(
        databaseNumber: "08X282",
        schoolName: "Women's Academy of Excellence",
        testTakerCount: "44",
        averageCriticalReadingScore: "407",
        averageMathScore: "386",
        averageWritingScore: "378"
    )
    
    func completeWithSuccess(at index: Int = 0) {
        messages[index](.success([mockSATScore]))
    }
    
    func completeWithFailure(at index: Int = 0) {
        messages[index](.failure(.invalidError))
    }
    
    override func fetchSATScores(_ completion: @escaping (Result<[Response], APIError>) -> Void) {
        messages.append(completion)
    }
}
