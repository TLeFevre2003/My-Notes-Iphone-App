//
//  CreateNote.swift
//  ToDo
//
//  Created by Tyler LeFevre on 2/22/24.
//

import SwiftUI

struct CreateNote: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var item = NoteItem()
   
    var body: some View {
        List {
           // Write the name of the note
            TextField("Name", text: $item.title)
                       
           // Press create to create new Note item
            Button("Create") {
                
                withAnimation {
                    context.insert(item)
                }
                dismiss()
            }
        }
        .navigationTitle("Create Note")
    }
}
