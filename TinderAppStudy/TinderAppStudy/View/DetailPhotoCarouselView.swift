//
//  DetailPhotoCarouselView.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 06/06/22.
//

import UIKit

class DetailPhotoCarouselView: UICollectionViewCell {
    //Cria uma variável para a descrição
    let descriptionLabel: UILabel = .textBoldLabel(16)
    
    //Criando uma variável para as fotos do slide
    let slidePhotoViewController = SlidePhotosViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Adiciona um texto para a descrição
        descriptionLabel.text = "Fotos recentes no instagram"
        backgroundColor = .blue
        //Adiciona o texto na view
        addSubview(descriptionLabel)
        descriptionLabel.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20)
        )
        
        //Adiciona na tela a view das fotos
        addSubview(slidePhotoViewController.view)
        
        slidePhotoViewController.view.fill(
            top: descriptionLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
