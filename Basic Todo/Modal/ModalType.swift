//
//  ModalType.swift
//  Basic Todo
//
//  Created by Norberto Fernandez on 8/22/21.
//

import SwiftUI

enum ModalType: Identifiable, View {
    case new
    case update(TodoItem)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return TodoFormView(formVM: TodoForm())
        case .update(let todo):
            return TodoFormView(formVM: TodoForm(todo))
        }
    }
}
