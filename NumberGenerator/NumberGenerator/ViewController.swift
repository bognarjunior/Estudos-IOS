//
//  ViewController.swift
//  NumberGenerator
//
//  Created by José Roberto Bognar Junior on 11/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var labelResult: UILabel!
    @IBAction func generate(_ sender: Any) {
        let number =  arc4random_uniform(61)
        button.setImage(UIImage(named: "botaogerar"), for: .normal)
        button.setImage(UIImage(named: "botaogerar-pressionado"), for: .highlighted)
        labelResult.text = String(number)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelResult.text = ""
    }


}

