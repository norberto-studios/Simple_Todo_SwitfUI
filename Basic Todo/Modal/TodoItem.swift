//
//  TodoItem.swift
//  Basic Todo
//
//  Created by Norberto Fernandez on 8/18/21.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var completed: Bool = false
    
    static var sampleData: [TodoItem] {
       [
        TodoItem(name: "Buy bananas"),
        TodoItem(name: "GO to the super", completed: true)
       ]
    }
}
