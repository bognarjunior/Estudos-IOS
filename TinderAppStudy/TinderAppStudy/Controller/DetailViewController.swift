//
//  DetailViewController.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 05/06/22.
//

import UIKit

class HeaderLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //Cria uma variável para pegar os atributos e poder sobrescrever
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        //Percorrer os atributos
        layoutAttributes?.forEach({ (attribute) in
            //Verifica se o atributo é o header
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader {
                
                //Atribui a variável para fazer o tratamento
                guard let collectionView = collectionView else {return}
                //Atribui para a variável o valor do scroll
                let contentOffsetY = collectionView.contentOffset.y
                
                //Atribui na valores para attribute, realizando assim o efeito elástico
                attribute.frame = CGRect(
                    x: 0,
                    y: contentOffsetY,
                    width: collectionView.bounds.width,
                    height: attribute.bounds.height - contentOffsetY
                )
            }
        })
        //Retorna a variável
        return layoutAttributes
    }
    //Subescreve a função para atualizar o valor do layout
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

class DetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    //Cria o usuário
    var user: User? {
        didSet{
            //Quando o usuário for setado faz o reload na tela
            self.collectionView.reloadData()
        }
    }
    
    //Identificadores
    let cellId = "cellId"
    let headerId = "headerId"
    let perfilId = "perfilId"
    let photoId = "photoId"
    
    //Criando os botões do footer
    var deslikeButton: UIButton = .iconFooter(named: "deslikeButton")
    var likeButton: UIButton = .iconFooter(named: "likeButton")
    
    var callback: ((User?, ACTION) -> Void)?
    
    init() {
        //Inicia o nosso layout, indicando que é na vertical
        super.init(collectionViewLayout: HeaderLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        //Ajusta para iniciar no topo
        collectionView.contentInsetAdjustmentBehavior = .never
        
        //Adiciona padding na view
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 135, right: 0)
        
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        //Registrando o layout
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        //Registrando o Header
        collectionView.register(DetailHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:  headerId)
        //Registrando o perfil
        collectionView.register(DetailPefilView.self, forCellWithReuseIdentifier: perfilId)
        //Registrando o carrossel de fotos
        collectionView.register(DetailPhotoCarouselView.self, forCellWithReuseIdentifier: photoId)
        
        //Chama a função para adicionar o footer
        self.addFooter()
    }
    
    //Retorna o número de células
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Adiciona as células
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: perfilId, for: indexPath) as! DetailPefilView
            cell.user = self.user
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoId, for: indexPath) as! DetailPhotoCarouselView
        //cell.user = self.user
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //Adiciona o header
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DetailHeaderView
        header.user = self.user
        return header
    }
    
    func addFooter() {
        let stackView = UIStackView(arrangedSubviews: [UIView(), deslikeButton, likeButton, UIView()])
        //Centralizar os itens da stackView
        stackView.distribution = .equalCentering
        
        //Adiciona a stackview dentro da view
        view.addSubview(stackView)
        stackView.fill(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: 34, right: 16)
        )
        
        
        //Adicionando ação nos botões
        deslikeButton.addTarget(self, action: #selector(deslikeClick), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(likeClick), for: .touchUpInside)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.height * 0.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Cria variáveis para altura e largura
        let width: CGFloat = UIScreen.main.bounds.width
        var height: CGFloat = UIScreen.main.bounds.width * 0.66
        
        
        if indexPath.item == 0 {
            //tribui para a célula os tamanho
            let cell = DetailPefilView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            cell.user = self.user
            //Permite alterar o tamanho
            cell.layoutIfNeeded()

            //Cria uma variável para estimar o tamanho
            let size = cell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = size.height
        }
        
        return .init(width: width, height: height)
    }
    
    //Função de deslike
    @objc func deslikeClick() {
        self.callback?(self.user, ACTION.DESLIKE)
        self.closeModal()
    }
    
    //Função de like
    @objc func likeClick() {
        self.callback?(self.user, ACTION.LIKE)
        self.closeModal()
    }
    
    //Função para voltar
    @objc func closeModal() {
        self.dismiss(animated: true, completion: nil)
    }
}
