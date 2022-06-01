//
//  UIView.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 29/05/22.
//

import UIKit

extension UIView {
  
    //Cria a função para preencher as constraints
    func fill(
        top: NSLayoutYAxisAnchor?,
        leading: NSLayoutXAxisAnchor?,
        trailing: NSLayoutXAxisAnchor?,
        bottom: NSLayoutYAxisAnchor?,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero) {
            //Seta o valor de constraints automático para falso,
            //assim podemos criar as constraints via código
            translatesAutoresizingMaskIntoConstraints = false
            
            //Verifica se recebeu o parâmetro top
            if let top = top {
                //Atribui para o top os valores passados por parâmetro e ativa a constraint
                topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
            }
            //Verifica se recebeu o parâmetro leading(Atribui valores para a esquerda)
            if let leading = leading {
                //Atribui para o leading os valores passados por parâmetro e ativa a constraint
                leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
            }
            //Verifica se recebeu o parâmetro trailing(Atribui valores para a direita)
            if let trailing = trailing {
                //Atribui para o trailing os valores passados por parâmetro e ativa a constraint
                trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
            }
            //Verifica se recebeu o parâmetro botton
            if let bottom = bottom {
                //Atribui para o bottom os valores passados por parâmetro e ativa a constraint
                bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
            }
            //Verifica se size width é diferente de zero
            if size.width != 0 {
                //Atribui para o size width os valores passados por parâmetro e ativa a constraint
                widthAnchor.constraint(equalToConstant: size.width).isActive = true
            }
            //Verifica se size height é diferente de zero
            if size.height != 0 {
                //Atribui para o size height os valores passados por parâmetro e ativa a constraint
                heightAnchor.constraint(equalToConstant: size.height).isActive = true
            }
    }
    
    //Função que recebe os parâmetros do pai onde está sendo injetada a view
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        fill(
            top: superview?.topAnchor,
            leading: superview?.leadingAnchor,
            trailing: superview?.trailingAnchor,
            bottom: superview?.bottomAnchor,
            padding: padding
        )
    }

    func centerSuperview (size: CGSize = .zero) {
        //Seta o valor de constraints automático para falso,
        //assim podemos criar as constraints via código
        translatesAutoresizingMaskIntoConstraints = false
        
        //Verifica se recebeu o parâmetro o eixo X da superview
        if let superviewCenterX = superview?.centerXAnchor {
            //Atribui para o eixo x da view o valor do x da superview(Pai)
            centerXAnchor.constraint(equalTo: superviewCenterX).isActive = true
        }
        //Verifica se recebeu o parâmetro o eixo y da superview
        if let superviewCenterY = superview?.centerYAnchor {
            //Atribui para o eixo y da view o valor do y da superview(Pai)
            centerYAnchor.constraint(equalTo: superviewCenterY).isActive = true
        }
        //Verifica se size width é diferente de zero
        if size.width != 0 {
            //Atribui para o size width os valores passados por parâmetro e ativa a constraint
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        //Verifica se size height é diferente de zero
        if size.height != 0 {
            //Atribui para o size height os valores passados por parâmetro e ativa a constraint
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func size(size: CGSize = .zero) {
        //Seta o valor de constraints automático para falso,
        //assim podemos criar as constraints via código
        translatesAutoresizingMaskIntoConstraints = false
        //Verifica se size width é diferente de zero
        if size.width != 0 {
            //Atribui para o size width os valores passados por parâmetro e ativa a constraint
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        //Verifica se size height é diferente de zero
        if size.height != 0 {
            //Atribui para o size height os valores passados por parâmetro e ativa a constraint
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

