//
//  SlidePhotosViewController.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 06/06/22.
//

import UIKit

class SlidePhotosViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    //Cria variáveis de identificadores
    let cellId = "cellId"
    
    let photos: [String] = [
        "pessoa-1",
        "pessoa-2",
        "pessoa-3",
        "pessoa-4",
        "pessoa-5",
        "pessoa-6",
        "pessoa-7",
    ]
    
    init() {
        //Cria uma variável de para trabalhar o layout
        let layout = UICollectionViewFlowLayout()
        //Atribui para o layout o scroll na horizontal
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Registrando o layout
        collectionView.register(SlidePhotoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Cria as células
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SlidePhotoCell
        cell.pictureImageView.image = UIImage(named: self.photos[indexPath.item])
        return cell
    }
    
    //Função para atribuir tamanho para as células
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.height / 2 - 10
        return .init(width: size, height: size)
    }
    
    //Função para adicionar espaçamento mínimo
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //Função para atribuir margin a view que contêm as fotos
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 20, bottom: 0, right: 20)
    }
}
