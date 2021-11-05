//
//  MockURLSession.swift
//  JobSearch
//
//

import Foundation
class MockURLSession: URLSession {
    
    var cachedUrl: URL?
    private let mockTask: MockTask
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        mockTask = MockTask(data: data, urlResponse: urlResponse, error: error)
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        mockTask.completionHandler = completionHandler
        return mockTask
    }
}
