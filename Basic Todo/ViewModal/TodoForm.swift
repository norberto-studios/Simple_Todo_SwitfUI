//
//  TodoForm.swift
//  Basic Todo
//
//  Created by Norberto Fernandez on 8/18/21.
//

import Foundation

class TodoForm: ObservableObject {
    @Published var name = ""
    @Published var completed = false
    var id: UUID?
    
    var updating: Bool {
        id != nil
    }
    
    var isDisable: Bool {
        name.isEmpty
    }
    
    init() {}
    
    init(_ currentTodo: TodoItem) {
        self.name = currentTodo.name
        self.completed = currentTodo.completed
        id = currentTodo.id
    }
}
