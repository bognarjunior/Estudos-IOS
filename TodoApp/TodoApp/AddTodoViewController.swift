//
//  AddTodoViewController.swift
//  TodoApp
//
//  Created by José Roberto Bognar Junior on 27/06/22.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var txtTodo: UITextField!
    
    @IBAction func addTodo(_ sender: Any) {
        if let newTodo = txtTodo.text {
            let TodoService = TodoService()
            TodoService.save(todo: newTodo)
            txtTodo.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
