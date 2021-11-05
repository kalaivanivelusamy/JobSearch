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


struct Networking {
    var urlSession = URLSession.shared
    
    func sendPostRequest(to url: URL,body: Data,then handler: @escaping (Result<Data,Error>) -> Void)){
     
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        request.httpMethod = "POST"
        
        let task = urlSession.uploadTask(with: request, from: body, completionHandler: { data, response, error in
            
            
        })
        task.resume()
    }
}
