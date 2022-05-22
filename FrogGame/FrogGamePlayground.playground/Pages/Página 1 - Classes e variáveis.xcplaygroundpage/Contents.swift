
//: # Página 1 - Classes e variáveis

import UIKit
import PlaygroundSupport

//: ![Imagem](passo1.png)
//: Escreva aqui a classe do sapo que será usada.
class Frog {
    var height: Int = 70
    var width: Int = 70
    var xPosition: Int = 100
    var yPosition: Int = 300
    var imageNameFrog: String = "forg.png"
}



//: ![Imagem](passo2.png)
//: Crie novos sapos.
var frog1 = Frog()
var frog2 = Frog()
//: ![Imagem](passo3.png)
//: Imprima informações de algum sapo criado acima.
print(frog1.height)

//: ![Imagem](passo4.png)
/*
 // Interface que apresenta sapo(s) criado(s)
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

// Código responsável por instanciar uma insterface e aoresentar no liveView
var viewController = MyScreenViewController()
PlaygroundPage.current.liveView = viewController
*/

//: [Próximo](@next)
