//
//  ViewController.swift
//  MyMovies
//
//  Created by José Roberto Bognar Junior on 19/06/22.
//

import UIKit

class ViewController: UITableViewController {
    let cellId = "cellId"
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        var movie: Movie
        movie = Movie(title: "007 - Spectre", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme1")
        movies.append(movie)
        movie = Movie(title: "Star Wars", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme2")
        movies.append(movie)
        movie = Movie(title: "Impacto Mortal", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme3")
        movies.append(movie)
        movie = Movie(title: "Deadpool", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme4")
        movies.append(movie)
        movie = Movie(title: "O Regresso", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme5")
        movies.append(movie)
        movie = Movie(title: "A Herdeira", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme6")
        movies.append(movie)
        movie = Movie(title: "Caçadores de emoção", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme7")
        movies.append(movie)
        movie = Movie(title: "Regresso do mal", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme8")
        movies.append(movie)
        movie = Movie(title: "Tarzan", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme9")
        movies.append(movie)
        movie = Movie(title: "Hardcore: Missão Extrema", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.", image: "filme10")
        movies.append(movie)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieTableViewCell
        cell.titleLabel.text = movie.title
        cell.descriptionLabel.text = movie.description
        cell.pictureImageView.image = movie.image
        cell.pictureImageView.layer.cornerRadius = 42
        cell.pictureImageView.clipsToBounds = true
        return cell
    }
}

