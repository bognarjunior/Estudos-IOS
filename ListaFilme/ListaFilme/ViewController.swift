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

    
    @IBAction func loginAction(_ sender: Any) {
        
        if (txtUser.text == "bognar" &&
            txtPwd.text == "1234") {
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

