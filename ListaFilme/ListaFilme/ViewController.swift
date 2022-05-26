//
//  ViewController.swift
//  ListaFilme
//
//  Created by José Roberto Bognar Junior on 23/05/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func createMovie() {
        
        let movie1 = Movie(name: "Coração Valente",
                           imageName: "coracaoValente", isMyFavorite: true)
        let movie2 = Movie(name: "Shrek",
                           imageName: "shrek", isMyFavorite: true)
        let movie3 = Movie(name: "O Senhor dos Anéis: O Retorno do Rei",
                           imageName: "senhoraneis", isMyFavorite: true)
        let movie4 = Movie(name: "Vingadores",
                           imageName: "vingadores", isMyFavorite: true)
        let movie5 = Movie(name: "Star Wars: O Império Contra-ataca",
                           imageName: "starWars5", isMyFavorite: true)
        let movie6 = Movie(name: "Star Wars: O Retorno de Jedi",
                           imageName: "starWars6", isMyFavorite: true)
        let movie7 = Movie(name: "Harry Potter",
                           imageName: "harryPotter", isMyFavorite: false)
        let movie8 = Movie(name: "Coringa",
                           imageName: "joker", isMyFavorite: false)
        let movie9 = Movie(name: "Matrix",
                           imageName: "matrix1", isMyFavorite: false)
        let movie10 = Movie(name: "Devolta Para o Futuro",
                            imageName: "deVoltaFuturo1", isMyFavorite: false)
        let movie11 = Movie(name: "De Volta Para o Futuro 2",
                            imageName: "deVoltaFuruto2", isMyFavorite: false)
        
        DataMovies.movies.append(movie1)
        DataMovies.movies.append(movie2)
        DataMovies.movies.append(movie3)
        DataMovies.movies.append(movie4)
        DataMovies.movies.append(movie5)
        DataMovies.movies.append(movie6)
        DataMovies.movies.append(movie7)
        DataMovies.movies.append(movie8)
        DataMovies.movies.append(movie9)
        DataMovies.movies.append(movie10)
        DataMovies.movies.append(movie11)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        if (txtUser.text == "bognar" &&
            txtPwd.text == "1234") {
            DataMovies.movies.removeAll()
            createMovie()
            performSegue(withIdentifier: "home", sender: self)
        }
        else {
            print("Usuário ou senha inválidos")
            let alert = UIAlertController(title: "Alert", message: "Usuário ou senha inválidos", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
}

