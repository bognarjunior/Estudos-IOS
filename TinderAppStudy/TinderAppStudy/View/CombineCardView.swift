//
//  CombineCardView.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 29/05/22.
//

import UIKit

class CombineCardView: UIView {
    //Cria uma variável de usuários
    var user: User? {
        //Testa quando o usuário for atribuído
        didSet{
            //Valida se a variável tem valor
            if let user = user {
                //Atribui valores as variáveis
                nameLabel.text = user.name
                ageLabel.text = String(user.age)
                descriptionLabel.text = user.description
                pictureImageView.image = UIImage(named: user.picture)
            }
        }
    }
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
    //Cria um label para adicionar na tela
    var nameLabel: UILabel = .textBoldLabel(32, textColor: .white)
    var ageLabel: UILabel = .textLabel(28, textColor: .white)
    var descriptionLabel: UILabel = .textLabel(18, textColor: .white, numberOfLines: 3)
    
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
        
        //Adiciona a sombra as variáveis
        nameLabel.addShadow()
        ageLabel.addShadow()
        descriptionLabel.addShadow()
        
        // Cria uma stackView para adicionar e formatar nome e idade
        let nameAgeStackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, UIView()])
        //Cria um espaçamento para o nome e a idade não ficarem colados
        nameAgeStackView.spacing = 12
        
        //Cria uma stackview para adicionar e formatar o a descrição
        let stackView = UIStackView(arrangedSubviews: [nameAgeStackView, descriptionLabel])
        //Distribui a stackview de forma igual
        stackView.distribution = .fillEqually
        //Atribui o eixo da stackview na vertical
        stackView.axis = .vertical
        
        //Adiciona a stackview na tela
        addSubview(stackView)
        
        //Alinha a stackview na tela
        stackView.fill(
            top: nil,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: 16, right: 16)
        )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
