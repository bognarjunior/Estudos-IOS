//
//  UIImageView.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 31/05/22.
//

import UIKit

extension UIImageView {
    
    static func pictureImageView(named: String? = nil) -> UIImageView {
        //Cria uma variável para a imagem
        let imageView = UIImageView()
        //Verifica a variável para ver se ela foi atribuída
        if let named = named {
            //Atribui para o umageview o valod da imagem
            imageView.image = UIImage(named: named)
        }
        //Trata a imagem para ela não ficar esticada
        imageView.contentMode = .scaleAspectFill
        //Corta a imagem caso ela seja maior que o card
        imageView.clipsToBounds = true
        //Retorna a imagem tratada
        return imageView
    }
    
    static func iconCard(named: String) -> UIImageView{
        //Cria uma variável para a imagem
        let imageView = UIImageView()
        //Atribui para o umageview o valod da imagem
        imageView.image = UIImage(named: named)
        //Seta o valor para o tamanho do icone
        imageView.size(size: .init(width: 50, height: 50))
        //Deixa a imagem invisível para ser animada mais tarde
        imageView.alpha = 0
        //Retorna a imagem tratada
        return imageView
    }
}
