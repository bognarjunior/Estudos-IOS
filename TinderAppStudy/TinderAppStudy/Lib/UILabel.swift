//
//  UILabel.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 30/05/22.
//

import UIKit

extension UILabel {
    //Cria uma função que retorna um label
    static func textLabel(_ size: CGFloat,
                          textColor: UIColor = .black,
                          numberOfLines: Int = 1
    ) -> UILabel {
        //Cria a variável para fazer os tratamentos
        let label = UILabel()
        //Atribui tamanho da font
        label.font = UIFont.systemFont(ofSize: size)
        //Atribui cor da font
        label.textColor = textColor
        //Atribui o número de linhas
        label.numberOfLines = numberOfLines
        //Retorna o label
        return label
    }
    
    //Cria uma função que retorna um label bold
    static func textBoldLabel(_ size: CGFloat,
                          textColor: UIColor = .black,
                          numberOfLines: Int = 1
    ) -> UILabel {
        //Cria a variável para fazer os tratamentos
        let label = UILabel()
        //Atribui tamanho da font só que agora bold
        label.font = UIFont.boldSystemFont(ofSize: size)
        //Atribui cor da font
        label.textColor = textColor
        //Atribui o número de linhas
        label.numberOfLines = numberOfLines
        //Retorna o label
        return label
    }
    //Cria uma função para adicionar a sombra
    func addShadow () {
        //Atribui cor
        self.layer.shadowColor = UIColor.black.cgColor
        //Atribui a espessura
        self.layer.shadowRadius = 2.0
        //Atribui o alpha ou opacidade
        self.layer.shadowOpacity = 0.8
        //Posição da sombra
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        //Seta falso para corta a sombra
        self.layer.masksToBounds = false
    }
}
