
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
    var imageNameFrog: String = "frog.png"
}



//: ![Imagem](passo2.png)
//: Crie novos sapos.
var frog1 = Frog()
frog1.xPosition = 300
var frog2 = Frog()

//: ![Imagem](passo4.png)

 // Interface que apresenta sapo(s) criado(s)
class MyScreenViewController : UIViewController {

    override func viewDidLoad() {
        let myFrog1 = Frog()
        addFrog(frog: myFrog1)
        
        let myFrog2 = Frog()
        myFrog2.xPosition = myFrog1.xPosition + 150
        addFrog(frog: myFrog2)
    }

    func addFrog(frog:Frog){
        print(frog.imageNameFrog)
        let imageView = UIImageView(image: UIImage(named: frog.imageNameFrog))
        imageView.frame = CGRect(x: frog.xPosition, y: frog.yPosition, width: frog.width, height: frog.height)
        view.addSubview(imageView)
    }

}

// Código responsável por instanciar uma insterface e apresentar no liveView
var viewController = MyScreenViewController()
PlaygroundPage.current.liveView = viewController

//: [Próximo](@next)
