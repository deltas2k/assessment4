//
//  MOMovieTableViewController.swift
//  assessment4
//
//  Created by Matthew O'Connor on 10/11/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class MOMovieTableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [MOMovie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.rowHeight = 180
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
            
        }
        
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MOMovieTableViewCell else {return UITableViewCell()}
        let movie = movies[indexPath.row]
        cell.updateViews(with: movie)

        return cell
    }


}

extension MOMovieTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        MOMovieController.fetchMovieTitle(searchText.lowercased()) { (movie) in
            self.movies = movie
        }
    }
}
