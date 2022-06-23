//
//  DetailMoviesViewController.swift
//  MyMovies
//
//  Created by José Roberto Bognar Junior on 22/06/22.
//

import UIKit

class DetailMoviesViewController: ViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie.title
        descriptionLabel.text = movie.description
        imageView.image = movie.image
    }
}
