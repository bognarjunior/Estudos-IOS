//: [Anterior](@previous)

//: # Página 2 - Inicializadores, Constantes e Optional

import UIKit
import PlaygroundSupport

//: ![Imagem](passo1_page2.png)
//: Altere a classe Frog incluindo um inicializador.
class Frog {
    var height:Int = 100
    var width:Int = 100
    var xposition:Int = 100
    var yposition:Int = 200
    var nameImageFrog:String = "frog.png"
    
    /*
    init(x:Int, y:Int){
        
    }
     */
}


//: ![Imagem](passo2_page2.png)
//: Crie um sapo usando o inicializado. Abaixo há um código exemplo.
//var frog = Frog(x: 200, y: 100)

//: ![Imagem](passo3_page2.png)
//: Imprima informações do sapo criado acima.

//print(frog.xposition)
//print(frog.yposition)

//: ![Imagem](passo4_page2.png)

/*
// Classe responsável por representar uma interface simples que apresenta um sapo na tela.
 class MyScreenViewController : UIViewController {

    override func viewDidLoad() {
        //let myFrog1 = Frog()
        //addFrog(frog: myFrog1)
    }

    func addFrog(frog:Frog){
        
        let imageView = UIImageView(image: UIImage(named: frog.nameImageFrog))
        imageView.frame = CGRect(x: frog.xposition, y: frog.yposition, width: frog.width, height: frog.height)
        view.addSubview(imageView)
    }

}

var viewController = MyScreenViewController()
PlaygroundPage.current.liveView = viewController

*/
//: [Próximo](@next)

