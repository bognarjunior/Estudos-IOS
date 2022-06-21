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
        movie = Movie(title: "Filme 1", description: "Descrição 1")
        movies.append(movie)
        movie = Movie(title: "Filme 2", description: "Descrição 2")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = movie.title
        return cell
    }
}

