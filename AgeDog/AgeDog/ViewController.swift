//
//  ViewController.swift
//  AgeDog
//
//  Created by José Roberto Bognar Junior on 07/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var textAge: UITextField!
    
    @IBAction func discoverAge(_ sender: Any) {
        
        if textAge.text == "" {
            resultLabel.text = "Digite um número na caixa de texto"
        } else {
            let result:Int = Int(textAge.text!)! * 7
            
            resultLabel.text = "A idade do cachorro em anos humanos é: \(result)"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resultLabel.text = ""
    }


}

