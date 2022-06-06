//
//  SlidePhotoCell.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 06/06/22.
//

import UIKit

class SlidePhotoCell: UICollectionViewCell {
    //Cria uma variável para a foto
    var pictureImageView: UIImageView = .pictureImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Arredondar os cantos
        layer.cornerRadius = 8
        //Fazer o recorte
        clipsToBounds = true
        
        //Adiciona a imagem na view
        addSubview(pictureImageView)
        //Auto layout
        pictureImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
