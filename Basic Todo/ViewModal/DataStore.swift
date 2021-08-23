//
//  DataStore.swift
//  Basic Todo
//
//  Created by Norberto Fernandez on 8/18/21.
//

import Foundation

class DataStore: ObservableObject {
    @Published var todoItems: [TodoItem] = []
    @Published var appError: ErrorType? = nil
    
    init() {
        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: fileName)
        {
            loadTodos()
        }
    }
    
    func addTodo(_ todoItem: TodoItem){
        todoItems.append(todoItem)
        saveTodo()
    }
    
    func updateTodo(_ todoItem: TodoItem){
        guard let index = todoItems.firstIndex(where: { $0.id == todoItem.id }) else { return }
        todoItems[index] = todoItem
        saveTodo()
    }
    
    func deleteTodo(at indexSet: IndexSet){
        todoItems.remove(atOffsets: indexSet)
        saveTodo()
    }
    
    func loadTodos() {
//        todoItems = TodoItem.sampleData - example data
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    todoItems = try decoder.decode([TodoItem].self, from: data)
                } catch {
//                    print(TodoError.decodingError.localizedDescription)
                    appError = ErrorType(error: .decodingError)
                }
            case .failure(let error):
//                print(error.localizedDescription)
                appError = ErrorType(error: error)
            }
        }
        
    }
    
    func saveTodo() {
        print("saving todo to file system")
        let  encoder = JSONEncoder()
        do {
            let data = try encoder.encode(todoItems)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { (error) in
                if let error = error {
//                    print(error.localizedDescription)
                    appError = ErrorType(error: error)
                }
            }
        } catch{
//            print(TodoError.encodeingError.localizedDescription)
            appError = ErrorType(error: .encodeingError)
        }
    }
}
