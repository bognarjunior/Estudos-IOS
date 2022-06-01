//
//  CombineViewController.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 29/05/22.
//

import UIKit

class CombineViewController: UIViewController {
    
    // Cria uma variável para atribuir os usuários
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adiciona cor no background da view
        view.backgroundColor = UIColor.systemBackground
        //Chama a função para pegar usuários
        self.getUsers()
    }
    
    //Função que retorna os usuários
    func getUsers() {
        //Busca os usuários do service
        UserService.shared.gerUsets { (users, err) in
            //Verifica se a variável está preenchida
            if let users = users {
                //Função assincrona para carregar os usiários
                DispatchQueue.main.async {
                    //Atribui para os usuários para a variável dentro do controler
                    self.users = users
                    //Chama a função para adicionar o card
                    self.addCard()
                }
            }
        }
    }
}

extension CombineViewController{
    func addCard() {
        
        // Cria um loop para adicionar mais cards na tela
        for user in users {
            //Cria uma nova view
            let card = CombineCardView()
            //Adiciona o tamanho e o posicionamento para a view
            card.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
            //Atribui para o usuário do card o nosso usuário selecionado
            card.user = user
            //Atribui para o identificador único do card o id do usuário
            card.tag = user.id
            //Centralixando o card
            card.center = view.center
            // Cria a função para reconhecer os gestos e passa a referencia para ela
            let gesture =  UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(handlerCard))
            //Adidiona a referência da função para o card
            card.addGestureRecognizer(gesture)
            //Adiciona a view na tela(dentro de outra view)
            view.insertSubview(card, at: 0)
        }
        
        
    }
}

extension CombineViewController {
    @objc func handlerCard(gesture: UIPanGestureRecognizer){
        //Atribui a view para a variável e informa que ela é do tipo combine cardview
        if let card = gesture.view as? CombineCardView {
            //Atribui a variável o ponto onde o usuário está arrastando
            let point = gesture.translation(in: view)
            //Atribui para a view novos valores de x e y baseados onde o usuário está arrastando
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            //Atribui para a variável o valor que está arrastando para fazer a rotação
            let rotationAngle = point.x / view.bounds.width * 0.4
            
            //Verifica se a posição do x é maior que 0
            if point.x > 0 {
                //Atribui novos valores para alpha
                card.likeImageView.alpha = rotationAngle * 5
                card.deslikeImageView.alpha = 0
            } else {
                //Atribui novos valores para alpha
                card.likeImageView.alpha = 0
                card.deslikeImageView.alpha = rotationAngle * 5 * -1
            }
            
            //Aplica no card a rotação
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            //Testa se o movimento acabou
            if gesture.state == .ended {
                
                //Cria uma animação para o movimento ser mais suave quando voltar para a origem
                UIView.animate(withDuration: 0.5) {
                    //Atribui para o card a posição inicial no centro
                    card.center = self.view.center
                    //Volta a transformação para a posição de origem
                    card.transform = .identity
                    //Volta os valores para 0
                    card.likeImageView.alpha = 0
                    card.deslikeImageView.alpha = 0
                }
                
            }
        }
        
    }
}
