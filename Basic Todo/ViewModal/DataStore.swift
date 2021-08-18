//
//  DataStore.swift
//  Basic Todo
//
//  Created by Norberto Fernandez on 8/18/21.
//

import Foundation

class DataStore: ObservableObject {
    @Published var todoItem: [TodoItem] = []
    
    init() {
        loadTodos()
    }
    
    func addTodo(_ todoItem: TodoItem){
        
    }
    func updateTodo(_ todoItem: TodoItem){
        
    }
    func deleteTodo(at indexSet: IndexSet){
        
    }
    
    func loadTodos() {
        todoItem = TodoItem.sampleData
    }
    
    func saveTodo() {
        print("saving todo to file system")
    }
}
