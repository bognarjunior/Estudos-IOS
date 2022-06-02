//
//  UIButton.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 01/06/22.
//

import UIKit

extension UIButton {
    //Cria uma função para os icones header
    static func iconHeader(named: String) -> UIButton {
        //Cria a variável para fazer os tratamentos
        let button = UIButton()
        //Seta o tamanho do icone/botão
        button.size(size: .init(width: 32, height: 32))
        //Seta a imagem
        button.setImage(UIImage(named: named), for: .normal)
        //Retorna o botão
        return button
    }

    //Cria uma função para os icones do footer
    static func iconFooter(named: String) -> UIButton {
        //Cria a variável para fazer os tratamentos
        let button = UIButton()
        //Seta o tamanho do icone/botão
        button.size(size: .init(width: 64, height: 64))
        //Seta a imagem
        button.setImage(UIImage(named: named), for: .normal)
        //Seta a cor do fundo
        button.backgroundColor = .white
        //Adiciona o radius no botão
        button.layer.cornerRadius = 32
        
        //Corta a imagem caso ela seja maior que o card
        button.clipsToBounds = true
        
        //Adiciona cor para a sombra
        button.layer.shadowColor = UIColor.black.cgColor
        //Adiciona radius para a sombra
        button.layer.shadowRadius = 3.5
        //Adiciona opcidade para a sombra
        button.layer.shadowOpacity = 0.3
        //Posição da sombra
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        //Seta falso para corta a sombra
        button.layer.masksToBounds = false
        
        //Retorna o botão
        return button
    }
}
