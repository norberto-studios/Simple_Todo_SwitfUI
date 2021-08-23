//
//  TodoList.swift
//  Basic Todo
//
//  Created by Norberto Fernandez on 8/18/21.
//

import SwiftUI


struct TodoList: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var modalType: ModalType? = nil
    
    var body: some View {
        
        NavigationView{
            List() {
                ForEach(dataStore.todoItems) { todo in
                    Button {
                        modalType = .update(todo)
                    } label : {
                        Text(todo.name)
                            .font(.title3)
                            .strikethrough(todo.completed)
                            .foregroundColor(todo.completed ? .green : .blue)
                    }
                }
                .onDelete(perform: dataStore.deleteTodo )
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("My Todos")
                        .font(.largeTitle)
                        .bold()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        modalType = .new
                    } label: {
                        
                        Image(systemName: "plus.circle.fill")
                        
                    }
                }
            }

        }
        .sheet(item: $modalType) { $0 }
        .alert(item: $dataStore.appError) {
            appError in
            Alert(title: Text("OH OH"), message: Text(appError.error.localizedDescription))
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
            .environmentObject(DataStore())
    }
}
