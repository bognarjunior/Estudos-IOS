//
//  ViewController.swift
//  HeadOrTails
//
//  Created by José Roberto Bognar Junior on 17/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCoin" {
            let viewControllerDestination = segue.destination as! DetailsViewController
            viewControllerDestination.randomNumber = Int(arc4random_uniform(2))
        }
    }

}

