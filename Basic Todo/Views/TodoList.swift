//
//  TodoList.swift
//  Basic Todo
//
//  Created by Norberto Fernandez on 8/18/21.
//

import SwiftUI


struct TodoList: View {
    @EnvironmentObject var dataStore: DataStore
    
    var body: some View {
        
        NavigationView{
            List() {
                ForEach(dataStore.todoItem) { todo in
            
                    Text(todo.name)
                        .font(.title3)
                        .strikethrough(todo.completed)
                        .foregroundColor(todo.completed ? .green : .blue)
                }
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
                        
                    } label:{
                        
                        Image(systemName: "plus.circle.fill")
                        
                    }
                }
            }
//            .navigationBarItems(trailing: NavigationLink(destination: TodoList()){
//                Text("Add")
//            })
        }

    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
            .environmentObject(DataStore())
    }
}
