//
//  ViewController.swift
//  Notes
//
//  Created by José Roberto Bognar Junior on 24/06/22.
//

import UIKit

class ViewController: UIViewController {

    let keyNote: String = "note"
    @IBOutlet weak var txtNotes: UITextView!
    
    @IBAction func saveNotes(_ sender: Any) {
        if let text = txtNotes.text {
            UserDefaults.standard.set(text, forKey: keyNote)
        }
    }
    
    func getNote() -> String {
        if let recoveredText = UserDefaults.standard.object(forKey: keyNote){
            return recoveredText as! String
        }
        return ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtNotes.text = getNote()
    }


}

