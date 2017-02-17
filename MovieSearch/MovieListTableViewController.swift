//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Josh & Erica on 2/17/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    // MARK: - Properties
    
    var movies: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchTerm = searchBar.text else {
            print("No text entered.")
            return
        }
        
        MovieController.fetchMovieWith(searchTerm: searchTerm) { (movie) in
            self.movies = movie
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.searchBar.resignFirstResponder()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        cell.movies = movie
        
        return cell
    }
    
    // MARK: - Black Diamond Part 2: Click on image to bring movie poster to new view
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageView" {
            
            
        }
    }
    
}
