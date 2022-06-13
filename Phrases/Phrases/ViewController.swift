//
//  ViewController.swift
//  Phrases
//
//  Created by José Roberto Bognar Junior on 12/06/22.
//

import UIKit

class ViewController: UIViewController {

    var phrases:[String] = [
        "A persistência é o caminho do êxito.",
        "As pessoas costumam dizer que a motivação não dura sempre. Bem, nem o efeito do banho, por isso recomenda-se diariamente.",
        "Motivação é a arte de fazer as pessoas fazerem o que você quer que elas façam porque elas o querem fazer.",
        "Toda ação humana, quer se torne positiva ou negativa, precisa depender de motivação.",
        "No meio da dificuldade encontra-se a oportunidade.",
        "Lute. Acredite. Conquiste. Perca. Deseje. Espere. Alcance. Invada. Caia. Seja tudo o quiser ser, mas, acima de tudo, seja você sempre.",
        "A verdadeira motivação vem de realização, desenvolvimento pessoal, satisfação no trabalho e reconhecimento.",
        "É parte da cura o desejo de ser curado."
    ]
    
    @IBOutlet weak var labelPhrase: UILabel!
    
    @IBAction func newPrhase(_ sender: Any) {
        self.generatePhrase()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        phrases.append("Pedras no caminho? Eu guardo todas. Um dia vou construir um castelo.")
        self.generatePhrase()
    }

    func generatePhrase() {
        let index =  arc4random_uniform(UInt32(phrases.count))
        labelPhrase.text = phrases[Int(index)]
    }

}

