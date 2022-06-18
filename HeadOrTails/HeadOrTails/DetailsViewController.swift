//
//  DetailsViewController.swift
//  HeadOrTails
//
//  Created by José Roberto Bognar Junior on 17/06/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var randomNumber: Int!
    
    @IBOutlet weak var imageCoin: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.randomNumber == 0 {
            imageCoin.image = UIImage(named: "moeda_coroa")
        } else {
            imageCoin.image = UIImage(named: "moeda_cara")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
