//
//  JobSearchMiddleLayer.swift
//  JobSearch
//
//  Created by V, Kalaivani V. (623-Extern) on 01/11/21.
//

import Foundation

class JobSearchMiddleLayer {
    
    private lazy var jobServices = JobService()
    
    
    func getJob(parameters : [String: Any]) {
        
        jobServices.getJobDetails(parameters: parameters) { (response ,error) in
                 print("In Job search middle layer, api result is \(response)")
        }
    }
}
