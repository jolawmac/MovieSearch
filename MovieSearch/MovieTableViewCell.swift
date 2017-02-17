//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Josh & Erica on 2/17/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewTextView: UITextView!
    @IBOutlet weak var postImageView: UIImageView!
    
    // MARK: - Properties
    
    var movies: Movie? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Functions
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movies = nil
    }
    
    func updateViews() {
        guard let movie = movies else { return }
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "\(movie.rating)"
        movieOverviewTextView.text = movie.overview
        ImageController.image(forURL: (movie.imageURL)) { (image) in
            self.postImageView.image = image
        }
    }
    
}
