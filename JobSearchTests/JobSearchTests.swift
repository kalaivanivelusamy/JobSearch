//
//  JobSearchTests.swift
//  JobSearchTests
//
//  Created by V, Kalaivani V. (623-Extern) on 27/10/21.
//

import XCTest
@testable import JobSearch

class JobSearchTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetJobsWithExpectedURLHostAndPath() {
        
        let apiRepository = APIRepository()
        let mockURLSession  = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        
        apiRepository.session = mockURLSession
        apiRepository.getMovies{ movies, error in  }
        
        XCTAssertEqual(mockURLSession.cachedUrl?.host, "mymovieslist.com")
        XCTAssertEqual(mockURLSession.cachedUrl?.path, "/topmovies")
      }
    
    func testGetMoviesSuccessReturnsMovies(){
        let jsonData = "[{\"title\": \"Mission Impossible Fallout\",\"detail\": \"A Tom Cruise Movie\"}]".data(using: .utf8)

        let apiRepository = APIRepository()
        let mockURLSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        apiRepository.session = mockURLSession
        
        let moviesExpectation = expectation(description: "movies")
        var movieResponse: [Movie]?
        
        apiRepository.getMovies{ (movies,error) in
            movieResponse = movies
            moviesExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(movieResponse)
        }
    }
    
    
    func testGetMoviesWhenResponseErrorReturnsError(){
       
        let apiRepo = APIRepository()
        
        let error = NSError(domain: "error", code: 1234, userInfo: nil)
        let mockSession = MockURLSession(data: nil, urlResponse: nil, error: error)
        
        apiRepo.session = mockSession
        
        let errorExpectation = expectation(description: "error")
        let errorResponse: Error?
        
        apiRepo.getMovies{ (movies,error) in
            errorResponse = error
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(errorResponse)
        }
    }
    
    func testGetMoviesWhenEmptyDataReturnsError() {
        
        let apiRepo = APIRepository()
        let mockUrlSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        apiRepo.session = mockUrlSession
        
        let errorExpectation = expectation(description: "error")
        let errorResponse: Error?
        
        apiRepo.getMovies{ (movies,error) in
            errorResponse = error
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(errorResponse)
        }
    }
    
    func testGetMoviesInvalidJSONReturnsError() {
        let jsonData = "[{\"t\"}]".data(using: .utf8)
        let apiRep = APIRepository()
        let mockSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        apiRep.session = mockSession
        let errorExpectation = expectation(description: "error")
        var errorResponse: Error?
        
        apiRep.getMovies{ (movies, error) in
            errorResponse = error
            errorExpectation.fulfill()
        }
        waitForExpectations(timeout: 1){ (error) in
            XCTAssertNotNil(errorResponse)
        }

    }


}
