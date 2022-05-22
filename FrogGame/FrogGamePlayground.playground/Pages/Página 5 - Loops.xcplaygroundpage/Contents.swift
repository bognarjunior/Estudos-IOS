//: [Previous](@previous)

//: # Página 5 - Loops

//: ![Imagem](page5.png)

import UIKit
import PlaygroundSupport
import Foundation

// Classe Frog
class Frog {
    let height:Int = 70
    let width:Int = 70
    var xposition:Int = 100
    var yposition:Int = 200
    let nameImageFrog:String = "frog.png"
    
    init(x:Int, y:Int) {
        xposition = x
        yposition = y
    }
}

// Código da tela que apresenta um ou mais sapos
class MyScreenViewController : UIViewController {

    override func viewDidLoad() {
        
        presentFrogs()
        
    }
    
    func presentFrogs(){
        var initialX:Int = 50
        let initialY:Int = 200
        
        for i in 1...5{
            let myFrog = Frog(x: initialX, y: initialY)
            initialX += 50

            addFrog(frog: myFrog)
        }
        
        /*
        var i:Int = 1
        while (i<=6){
            let myFrog = Frog(x: initialX, y: initialY)
            initialX += 60
            
            addFrog(frog: myFrog)
            
            i = i + 1
            
        }
        */
    }

    func addFrog(frog:Frog){
        let imageView = UIImageView(image: UIImage(named: frog.nameImageFrog))
        imageView.frame = CGRect(x: frog.xposition, y: frog.yposition, width: frog.width, height: frog.height)
        view.addSubview(imageView)
    }

}

//Instanciação da interface
var viewController = MyScreenViewController()
// Execução da interface no liveView
PlaygroundPage.current.liveView = viewController


