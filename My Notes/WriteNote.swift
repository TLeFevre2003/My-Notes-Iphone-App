//
//  WriteNote.swift
//  ToDo
//
//  Created by Tyler LeFevre on 2/22/24.
//

import SwiftUI
import SwiftData

struct WriteNote: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Bindable var item: NoteItem
   
    
    var body: some View {
        List {
           
           // Write the title
            TextField("Title", text: $item.title)
           
           // Lets you write out a note
            TextEditor(text: $item.textBody) // TextEditor for the text body

           // Update button updates the note with what you wrote and updates the time
            Button("Update") {
               item.timestamp = Date()
                dismiss()
            }
        }
       // the title
        .navigationTitle("Save Note")
    }
}
