//
//  APIRepository.swift
//  JobSearch
//
//

import Foundation

class APIRepository {
    var session: URLSession!

    func getMovies(completion: @escaping([Movie]?, Error?) -> Void) {
        guard let url = URL(string: "https://mymovieslist.com/topmovies")
        else { fatalError() }
        session.dataTask(with: url) { (_, _, _) in }
    }
    
}
