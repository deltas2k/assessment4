//
//  MOMovieTableViewCell.swift
//  assessment4
//
//  Created by Matthew O'Connor on 10/11/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class MOMovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var synopsysLabel: UILabel!
    
    func updateViews(with movie: MOMovie) {
        movieLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        synopsysLabel.text = movie.overview
    }

}
