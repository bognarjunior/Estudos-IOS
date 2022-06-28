//
//  TodoService.swift
//  TodoApp
//
//  Created by José Roberto Bognar Junior on 27/06/22.
//

import UIKit

class TodoService {
    let TODOKEY = "TodoKey"
    var todos:[String] = []
    
    func save(todo: String) {
        todos = self.getTodo()
        todos.append(todo)
        
        UserDefaults.standard.set(todos, forKey: TODOKEY)
        print(self.getTodo())
    }
    
    func getTodo() -> Array<String> {
        let data = UserDefaults.standard.object(forKey: TODOKEY)
        return (data != nil) ? data as! Array<String> : []
    }
}
