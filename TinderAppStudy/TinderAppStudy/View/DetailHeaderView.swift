//
//  DetailHeaderView.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 05/06/22.
//

import UIKit

class DetailHeaderView: UICollectionReusableView {
    //Cria uma variável de usuários
    var user: User? {
        //Testa quando o usuário for atribuído
        didSet{
            //Valida se a variável tem valor
            if let user = user {
                //Atribui valores as variáveis
                pictureImageView.image = UIImage(named: user.picture)
            }
        }
    }
    //Cria uma variável para imagem do usuário
    var pictureImageView: UIImageView = .pictureImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pictureImageView)
        pictureImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
