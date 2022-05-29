//
//  CombineViewController.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 29/05/22.
//

import UIKit

class CombineViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adiciona cor no background da view
        view.backgroundColor = UIColor.systemBackground
        
        //Cria uma nova view
        let card = UIView()
        //Adiciona cor para a view
        card.backgroundColor = .red
        //Adiciona o tamanho e o posicionamento para a view
        card.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        //Centralixando o card
        card.center = view.center
        //Adiciona a view na tela(dentro de outra view)
        view.addSubview(card)
    }
}
