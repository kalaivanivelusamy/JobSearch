//
//  ServiceError.swift
//  JobSearch
//
//  Created by V, Kalaivani V. (623-Extern) on 01/11/21.
//

import Foundation

struct ServiceError: Error, Codable {
    let httpStatus: Int
    let message: String
    let description: String?
}

