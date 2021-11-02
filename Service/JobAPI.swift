//
//  JobAPI.swift
//  JobSearch
//
//

import Foundation

class JobAPI: APIHandler {
   
    func makeRequest(from data: [String : Any]) -> Request {
        
        let url = URL(string: "https://temper.works/api/v3/shifts?filter[date]=2021-10-27")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        return request
        
    }

    func parseResponse(data: Data) throws -> JobModel {
        return try defaultParseResponse(data: data)
    }
    
}
