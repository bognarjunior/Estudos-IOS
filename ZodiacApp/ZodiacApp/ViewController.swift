//
//  ViewController.swift
//  ZodiacApp
//
//  Created by José Roberto Bognar Junior on 18/06/22.
//

import UIKit

class ViewController: UITableViewController {
    var cellId = "cellId"
    var sings:[String] = [
        "Áries",
        "Touro",
        "Gêmeos",
        "Câncer",
        "Leão",
        "Virgem",
        "Libra",
        "Escorpião",
        "Sagitário",
        "Capricórnio",
        "Aquário",
        "Peixes"
    ]
    var meanings:[String] = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sagittis est in dui luctus vestibulum. Curabitur mattis, sem sit amet.",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = self.sings[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertController = UIAlertController(title: self.sings[indexPath.row], message: self.meanings[indexPath.row], preferredStyle: .alert)
        
        let actionConfirm = UIAlertAction(title: "Confirmar", style: .default)
        
        alertController.addAction(actionConfirm)
        
        present(alertController, animated: true)
    }
}

