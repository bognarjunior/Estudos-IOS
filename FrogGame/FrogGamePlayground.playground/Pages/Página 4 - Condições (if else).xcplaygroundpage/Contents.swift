//: [Anterior](@previous)


//: # Página 4 - Condições (if/else)


//: ![Imagem](page4.png)

import UIKit
import PlaygroundSupport
import Foundation

// Classe Frog
class Frog {
    let height:Int = 100
    let width:Int = 100
    var xposition:Int = 100
    var yposition:Int = 200
    let nameImageFrog:String = "frog.png"
    
    init(x:Int, y:Int) {
        xposition = x
        yposition = y
    }
}

// Classe que representa a interface do jogo
class GameViewController : UIViewController {
    
    // Elementos da interface
    var lblPoints: UILabel!
    var imageViewBackground:UIImageView!
    //var myView:UIView!
    
    // Constantes de configuração do jogo
    let maxPointsToWin = 50
    let messageVictory = "Parabéns, você ganhou!!"
    let messageLose = "Não foi dessa vez. Tente novamente!!"
    let heightScreen = 650
    let widthScreen = 480
    let imageNameBackground = "gameBackground.jpg"
    
    // Variáveis de configuração do jogo
    var timeIntervalFrogAppears = 2.0
    var timerFrogVisible = 2.0
    var currentPoints = 0
    var timerShowFrogs:Timer!
    var isPlayingGame = true
    
    
    // Função responsável por definir de quanto em quanto tempo o sapo será apresentado e sumirá do usuário
    @objc func creatingFrog(){
        /*
        if (currentPoints == 50){
            timerFrogVisible = 1.5
            timeIntervalFrogAppears = 1
        }
        else if (currentPoints == 100){
            timerFrogVisible = 1.0
            timeIntervalFrogAppears = 0.5
        }
         */
        // Função responsável por apresentar o sapo
        becomeFrogVisible()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let view = UIView()
                //view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: self.widthScreen, height: self.heightScreen + 100)
        
        imageViewBackground = UIImageView(image: UIImage(named: imageNameBackground))
        imageViewBackground.frame = CGRect(x: 0, y: -40, width: self.view.frame.width, height: self.view.frame.height+250)
        imageViewBackground.contentMode = .scaleToFill
    
        lblPoints = UILabel(frame: CGRect(x: 10, y: 5, width: 100, height: 100))
        lblPoints.text = "Points: \(currentPoints.description)"
        
        view.addSubview(imageViewBackground)
        view.addSubview(lblPoints)
        self.view.insertSubview(view, at: 0)
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(prepareFrogs), userInfo: nil, repeats: false)
    }
    
    override func viewDidLayoutSubviews() {
        view.center =  CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
    }
    
    // Função responsável por iniciar o descremento da contagem para o inicio do jogo.
    @objc func prepareFrogs(){
        timerShowFrogs = Timer.scheduledTimer(timeInterval: timeIntervalFrogAppears, target: self, selector: #selector(creatingFrog), userInfo: nil, repeats: false)
        
    }
    
   
    func becomeFrogVisible(){
        let y = Int.random(in: 300 ..< Int(self.view.frame.height) - 170)
        let x = Int.random(in: 10 ..< Int(self.view.frame.width) - 70)
        let frog = Frog(x: x, y: y)
        
        let imageView = UIImageView(image: UIImage(named: frog.nameImageFrog))
        
        imageView.frame = CGRect(x: frog.xposition, y: frog.yposition, width: frog.width, height: frog.height)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapImageView(_:)))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        
        self.view.addSubview(imageView)
        
        Timer.scheduledTimer(timeInterval: timerFrogVisible, target: self, selector: #selector(frogInvisible(sender:)), userInfo: ["image":imageView], repeats: false)
    }
    
    //Função responsável por tratar quando o jogador toca em um sapo
    @objc func handleTapImageView(_ sender: UITapGestureRecognizer) {
        
        sender.view?.isHidden = true
        sender.view?.removeFromSuperview()
        currentPoints = currentPoints + 10
        lblPoints.text = "Points: \(currentPoints.description)"
        
        if (currentPoints == maxPointsToWin){
            showFinalMessage(isWinner: true)
        }
        else{
            timerShowFrogs = Timer.scheduledTimer(timeInterval: timeIntervalFrogAppears, target: self, selector: #selector(creatingFrog), userInfo: nil, repeats: false)
        }
        
    }
    
    // Função responsável por tornar invisivel um sapo após um tempo
    @objc func frogInvisible(sender:Timer){
        let dict = sender.userInfo as? [String:UIImageView]
        let imageView = dict!["image"]
        
        if (imageView?.isHidden == false && isPlayingGame == true){
            imageView?.isHidden = true
            imageView?.removeFromSuperview()
            showFinalMessage(isWinner: false)
        }
        
    }
    
    // Função responsável por apresentar uma mensagem final ao usuário.
    func showFinalMessage(isWinner:Bool){
        isPlayingGame = false
        timerShowFrogs.invalidate()
        var finalMessageText:String!
        if (isWinner == false){
            finalMessageText = messageLose
        }
        else{
            finalMessageText = messageVictory
        }
        
        let alert = UIAlertController(title: "Resultado", message: finalMessageText, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

//Instanciação da interface
var viewController = GameViewController()
// Execução da interface no liveView
PlaygroundPage.current.liveView = viewController
