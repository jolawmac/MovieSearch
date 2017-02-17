//
//  Movie.swift
//  MovieSearch
//
//  Created by Josh & Erica on 2/17/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import Foundation


class Movie {
    
    private let titleKey = "original_title"
    private let ratingKey = "vote_average"
    private let overviewKey = "overview"
    private let posterKey = "poster_path"
    
    
    var title: String
    var rating: Double
    var overview: String
    var imageEndpoint: String
    var imageURL: String {
        return "http://image.tmdb.org/t/p/w500/\(imageEndpoint)"
    }
    
    init?(dictionary: [String:Any]) {
        
        guard let title = dictionary[titleKey] as? String,
            let rating = dictionary[ratingKey] as? Double,
            let overview = dictionary[overviewKey] as? String,
            let imageEndpoint = dictionary[posterKey] as? String else { return nil }
        
        self.title = title
        self.rating = rating
        self.overview = overview
        self.imageEndpoint = imageEndpoint
    }
    
}
