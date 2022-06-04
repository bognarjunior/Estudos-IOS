//
//  MatchViewController.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 03/06/22.
//

import UIKit

class MatchViewController: UIViewController {
    
    //Cria uma variável para receber a imagem
    let pictureImageView: UIImageView = .pictureImageView(named: "pessoa-1")
    
    //Cria uma variável para receber o icone do like
    let likeImageView: UIImageView = .pictureImageView(named: "likeButton")
    
    //Cria uma variável para a mensagem
    let messageLabel: UILabel = .textBoldLabel(18, textColor: .white, numberOfLines: 1)
    
    //Cria um campo de texto
    let messageText: UITextField = {
        //Cria uma variável para tratarmos o campo de texto
        let textField = UITextField()
        //Permite que ajustemos o auto layout
        textField.translatesAutoresizingMaskIntoConstraints = false
        //Altera o tamanho da altura
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        //Seta um placeholder para o campo de texto
        textField.placeholder = "Diga algo legal ..."
        //Seta uma cor de fundo
        textField.backgroundColor = .white
        //Arredonda a borda
        textField.layer.cornerRadius = 8
        //Cor do texto dentro do input
        textField.textColor = .darkText
        //Botão para finalizar
        textField.returnKeyType = .go
        
        //Cria uma view na esquerda dentro do text field para dar um espaço
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        
        //Cria a view na direita dentro do text field para colocar o botão
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 0))
        textField.rightViewMode = .always
        
        //Retorna o texto formatado
        return textField
    }()
    
    //Cria um botão para enviar a mensagem
    let messageButton: UIButton = {
        //Cria a variável para tratar o botão
        let button = UIButton()
        //Adiciona um texto ao botão
        button.setTitle("Enviar", for: .normal)
        //Seta as cores do botão em RGBA
        button.setTitleColor(UIColor(red: 62/255, green: 163/255, blue: 255/255, alpha: 1), for: .normal)
        //Tamanho da fonte do botão
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        //Retorna o botão tratado
        return button
    }()
    
    //Cria um botão para voltar
    let backButton: UIButton = {
        //Cria a variável para tratar o botão
        let button = UIButton()
        //Adiciona um texto ao botão
        button.setTitle("Voltar para o Tinder", for: .normal)
        //Adiciona uma cor ao botão
        button.setTitleColor(.white, for: .normal)
        //Tamanho da fonte do botão
        button.titleLabel?.font = .systemFont(ofSize: 16)
        //Retorna o botão tratado
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Adiciona a imagem na view
        view.addSubview(pictureImageView)
        //Posiciona a imagem para ocupar toda a view
        pictureImageView.fillSuperview()
        
        //Adiciona texto a mensagem
        messageLabel.text = "It's a Match!!!"
        //Centralizar o texto
        messageLabel.textAlignment = .center
        
        //Permite que ajustemos o auto layout
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        //Altera o tamanho da altura
        likeImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        //Seta a imagem para manter a proporção
        likeImageView.contentMode = .scaleAspectFit
        
        //Adiciona o botão no dentro da caixa de texto
        messageText.addSubview(messageButton)
        
        //Adiciona o auto layout
        messageButton.fill(
            top: messageText.topAnchor,
            leading: nil,
            trailing: messageText.trailingAnchor,
            bottom: messageText.bottomAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 16)
        )
        
        //Cria uma stackview para adicionar elementos na tela
        let stackView = UIStackView(arrangedSubviews: [likeImageView, messageLabel, messageText, backButton])
        //Seta o eixo da stackview para vertical
        stackView.axis = .vertical
        //Espaçamento entre os itens
        stackView.spacing = 16
        
        //Adiciona stackview dentro da view
        view.addSubview(stackView)
        
        //Adicionando o auto layout
        stackView.fill(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 32, bottom: 46, right: 32)
        )
        
    }
}
