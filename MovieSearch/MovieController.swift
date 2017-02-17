//
//  MovieController.swift
//  MovieSearch
//
//  Created by Josh & Erica on 2/17/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie?")
    
    static func fetchMovieWith(searchTerm: String, completion: @escaping ([Movie]) -> Void) {
        
        guard let url = baseURL else { completion([]); return }
        
        let urlParameters = ["api_key":"10c5d941b27e6633f72956e078d00158", "query":searchTerm]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion([])
                return
            }
            
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8) else { NSLog("No data return from network request"); completion([]); return }
            
            guard let jsonDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] else { NSLog("Unable to serialize JSON. Response: \(responseDataString)"); completion([]); return }
            
            guard let movieArray = jsonDictionary?["results"] as? [[String:Any]] else { NSLog("Unable to serialize JSON. Response: \(responseDataString)"); completion([]); return }
            
            let movies = movieArray.flatMap({ Movie(dictionary: $0) })
            completion(movies)
        }
        
    }
    
}
