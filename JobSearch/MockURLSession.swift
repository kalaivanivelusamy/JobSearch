//
//  MockURLSession.swift
//  JobSearch
//
//

import Foundation
class MockURLSession: URLSession {
    var cachedUrl: URL?
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        return URLSessionDataTask()
    }
}
