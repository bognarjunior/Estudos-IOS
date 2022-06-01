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
    var pictureImageView: UIImageView = .pictureImageView()
    
    //Cria as variáveis e formata os labels
    var nameLabel: UILabel = .textBoldLabel(32, textColor: .white)
    var ageLabel: UILabel = .textLabel(28, textColor: .white)
    var descriptionLabel: UILabel = .textLabel(18, textColor: .white, numberOfLines: 3)
    
    var deslikeImageView: UIImageView = .iconCard(named: "card-deslike")
    var likeImageView: UIImageView = .iconCard(named: "card-like")
        
    
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
        
        //Adiciona na view o deslike
        addSubview(deslikeImageView)
        deslikeImageView.fill(
            top: topAnchor,
            leading: nil,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        
        //Adiciona na view a imagem de like
        addSubview(likeImageView)
        likeImageView.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        
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
