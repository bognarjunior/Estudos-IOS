//
//  DetailPerfilView.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 05/06/22.
//

import UIKit

class DetailPefilView: UICollectionViewCell {
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
            }
        }
    }
    //Criando as variáveis para os labels
    let nameLabel: UILabel = .textBoldLabel(32)
    let ageLabel: UILabel = .textLabel(28)
    let descriptionLabel: UILabel = .textLabel(18, numberOfLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Cria uma stackview para adicionar os elementos na tela
        let nameAgeStackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, UIView()])
        //Espaçamento das views
        nameAgeStackView.spacing = 12
        
        //Cria a stackview global
        let stackView = UIStackView(arrangedSubviews: [nameAgeStackView, descriptionLabel])
        //Seta a distribuição da view de forma igualitária
        stackView.distribution = .fillEqually
        //Atribui o eixo da stack
        stackView.axis = .vertical
        //Adiciona a stackview na tela
        addSubview(stackView)
        //Seta o auto layout
        stackView.fillSuperview(
            padding: .init(
                top: 20,
                left: 20,
                bottom: 20,
                right: 20
            )
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
