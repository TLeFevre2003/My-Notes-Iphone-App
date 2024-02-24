//
//  My_NotesApp.swift
//  ToDo
//
//  Created by Tyler LeFevre on 2/22/24.
//

import SwiftUI
import SwiftData

@main
struct My_NotesApp: App {
   var body: some Scene {
       WindowGroup {
           ContentView()
               .modelContainer(for: NoteItem.self)
       }
   }
}
