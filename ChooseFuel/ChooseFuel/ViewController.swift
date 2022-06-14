//
//  ViewController.swift
//  ChooseFuel
//
//  Created by José Roberto Bognar Junior on 13/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var textEthanol: UITextField!
    @IBOutlet weak var textGasoline: UITextField!
    
    @IBAction func calculate(_ sender: Any) {
        if let valueEhanol = textEthanol.text {
            if let valueGasoline = textGasoline.text {
                let isValid = self.validateField(valueEthanol: valueEhanol, valueGasoline: valueGasoline)
                if isValid {
                    self.calculateValue(valueEthanol: valueEhanol, valueGasoline: valueGasoline)
                } else {
                    labelResult.text = "Digite os preços para calcular"
                    labelResult.textColor = .red
                }
            }
        }
    }
    
    func validateField(valueEthanol: String, valueGasoline: String) -> Bool {
        if valueEthanol.isEmpty || valueGasoline.isEmpty {
            return false
        }
        return true
    }
    
    func calculateValue(valueEthanol: String, valueGasoline: String) {
        if let valueEthanol = Double(valueEthanol.replacingOccurrences(of: ",", with: ".")) {
            if let valueGasoline = Double(valueGasoline.replacingOccurrences(of: ",", with: ".")) {
                print(valueEthanol)
                print(valueGasoline)
                labelResult.textColor = .white
                if (valueEthanol / valueGasoline) >= 0.7 {
                    labelResult.text = "Melhor utilizar gasolina"
                } else {
                    labelResult.text = "Melhor utilizar álcool"
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

