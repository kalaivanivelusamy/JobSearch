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
        session.dataTask(with: url) { (data,response, error) in 
            
            guard error == nil else{
                completion(nil,error)
                return
            }
            guard let data = data else {
                completion(nil,NSError(domain: "no data", code: 10, userInfo: nil))
                return
            }
            do{
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(movies, nil)
            } catch {
                completion(nil,error)
            }
        }.resume()
    }
    
}
