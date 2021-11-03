//
//  MockTask.swift
//  JobSearch
//
//

import Foundation


class MockTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?
    private let error: Error?
    
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
    }
    
    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler?(self.data,self.urlResponse,self.error)
        }
    }
}
