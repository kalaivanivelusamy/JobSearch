//
//  JobService.swift
//  JobSearch
//
//  Created by V, Kalaivani V. (623-Extern) on 01/11/21.
//

import Foundation

class JobService {
    
    func getJobDetails(parameters: [String: Any], completion: @escaping (JobModel?, Error?) -> ()) {
        
        let api = JobAPI()
        
        let apiLoader = APILoader(apiRequest: api)
        
        apiLoader.loadAPIRequest(requestData: parameters){ (result,error) in
            completion(result,error)
        }
    }
}
