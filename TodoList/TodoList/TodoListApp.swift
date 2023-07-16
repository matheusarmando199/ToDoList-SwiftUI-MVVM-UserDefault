//
//  TodoListApp.swift
//  TodoList
//
//  Created by Matheus Armando on 17/06/23.
//

import SwiftUI
/*
 MVVM Architecture
 
 Model -> Data Point
 View -> UI
 ViewModel -> Manage Model for Viws
 
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
