//
//  TodoFormView.swift
//  Basic Todo
//
//  Created by Norberto Fernandez on 8/18/21.
//

import SwiftUI

struct TodoFormView: View {
    @EnvironmentObject var dataStore: DataStore
    @ObservedObject var formVM: TodoForm
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form{
                VStack(alignment: .leading){
                    TextField("Todo", text: $formVM.name)
                    Toggle("Completed", isOn: $formVM.completed)
                }
            }
//            .navigationTitle("Todo Form")
            .navigationBarTitle("TODO", displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: updatingButton)
            
        }
    }
}

extension TodoFormView{
    func updateTodo() {
        let todo = TodoItem(id: formVM.id!, name: formVM.name, completed: formVM.completed)
        dataStore.updateTodo(todo)
        presentationMode.wrappedValue.dismiss()
    }
    func addTodo() {
        let todo = TodoItem(name: formVM.name)
        dataStore.addTodo(todo)
        presentationMode.wrappedValue.dismiss()
    }
    var cancelButton: some View {
        Button("Cancel"){
            presentationMode.wrappedValue.dismiss()
        }
    }
    var updatingButton: some View {
        Button(
            formVM.updating ? "Update" : "Save",
            action: formVM.updating ? updateTodo : addTodo)
            .disabled(formVM.isDisable)
    }

}



struct TodoFormView_Previews: PreviewProvider {
    static var previews: some View {
        TodoFormView(formVM: TodoForm())
            .environmentObject(DataStore())
    }
}
