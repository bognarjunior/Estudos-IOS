//
//  LoadingView.swift
//  TinderAppStudy
//
//  Created by José Roberto Bognar Junior on 02/06/22.
//

import UIKit

class LoadingView: UIView {
    
    //Cria uma função para tratar o load
    let loadView: UIView = {
        //Cria uma variável para o load
        let load = UIView()
        //Seta o tamanho do frame do load
        load.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        //Sera a cor de fundo RGBA
        load.backgroundColor = UIColor(red: 218/255, green: 99/255, blue: 111/255, alpha: 1)
        //Adiciona o radius(Metade do tamanho para ficar redondo)
        load.layer.cornerRadius = 50
        //Adiciona o tamanho da borda
        load.layer.borderWidth = 1
        //Adiciona a cor da borda
        load.layer.borderColor = UIColor.red.cgColor
        //Retorna a variável tratada
        return load
    }()
    
    func animatedLoad() {
        //Cria uma animação
        UIView.animate(withDuration: 1.3, animations: {
            //Atribui o tamanho do frame do load
            self.loadView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            //Centraliza o load
            self.loadView.center = self.center
            //Adiciona as bordas arredondadas
            self.loadView.layer.cornerRadius = 125
            //Cria uma transparência
            self.loadView.alpha = 0.3
            
        }) { (_) in
            //Atribui o tamanho
            self.loadView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            //Centraliza
            self.loadView.center = self.center
            //Adiciona a borda arredondada
            self.loadView.layer.cornerRadius = 50
            //Muda o alpha
            self.loadView.alpha = 1
            //Chama a animação
            self.animatedLoad()
    }
      
}
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(loadView)
        loadView.center = center
        self.animatedLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
