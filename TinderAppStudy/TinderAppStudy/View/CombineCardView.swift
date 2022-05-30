//
//  CombineCardView.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 29/05/22.
//

import UIKit

class CombineCardView: UIView {
    //Cria uma view de imagem para adicionar a foto
    var pictureImageView: UIImageView = {
        //Cria uma variável para a imagem
        let imageView = UIImageView()
        //Atribui a imagem
        imageView.image = UIImage(named: "pessoa-1")
        //Trata a imagem para ela não ficar esticada
        imageView.contentMode = .scaleAspectFill
        //Corta a imagem caso ela seja maior que o card
        imageView.clipsToBounds = true
        // retorna a imagem criada
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Tamanho da borda
        layer.borderWidth = 0.3
        //Cor da borda
        layer.borderColor = UIColor.lightGray.cgColor
        //Canto arredondado
        layer.cornerRadius = 8
        //Recorta
        clipsToBounds = true
        //Atribui a imagem para a view
        addSubview(pictureImageView)
        //Ajusta a imagem
        pictureImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
