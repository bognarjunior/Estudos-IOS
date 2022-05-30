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
        // Cria a função para reconhecer os gestos e passa a referencia para ela
        let gesture =  UIPanGestureRecognizer()
        gesture.addTarget(self, action: #selector(handlerCard))
        //Adidiona a referência da função para o card
        card.addGestureRecognizer(gesture)
        //Adiciona a view na tela(dentro de outra view)
        view.addSubview(card)
    }
}

extension CombineViewController {
    @objc func handlerCard(gesture: UIPanGestureRecognizer){
        //Atribui a view para a variável
        if let card = gesture.view {
            //Atribui a variável o ponto onde o usuário está arrastando
            let point = gesture.translation(in: view)
            //Atribui para a view novos valores de x e y baseados onde o usuário está arrastando
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            //Testa se o movimento acabou
            if gesture.state == .ended {
                
                //Cria uma animação para o movimento ser mais suave quando voltar para a origem
                UIView.animate(withDuration: 0.5) {
                    //Atribui para o card a posição inicial no centro
                    card.center = self.view.center
                }
                
            }
        }
        
    }
}
