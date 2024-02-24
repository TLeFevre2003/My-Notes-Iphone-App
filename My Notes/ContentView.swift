//
//  ContentView.swift
//  ToDo
//
//  Created by Tyler LeFevre on 2/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    
    @State private var showCreate = false
    @State private var toDoToEdit: NoteItem?
    @Query(sort: \NoteItem.timestamp) private var items: [NoteItem]
  
   // Most recent edited goes on top
   var sortedItems: [NoteItem] {
       items.sorted { (item1, item2) in
         
         return item1.timestamp > item2.timestamp
           
       }
   }
   
   
    var body: some View {
        NavigationStack {
            List {
                ForEach(sortedItems) { item in
                    NavigationLink(destination: WriteNote(item: item)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.largeTitle)
                                    .bold()
                                
                                Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                    .font(.callout)
                            }
            
                        }
                       // Makes it so we can click each note item
                        .contentShape(Rectangle())
                       
                       // Enable context menu for delete action
                        .contextMenu {
                            Button(action: {
                                deleteItem(item)
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .gesture(longPressToDelete(item)) // Gesture for long press to delete
                    }
                }
            }
           // Title
            .navigationTitle("Notes")
           
           // Adds the plus button to add notes
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showCreate.toggle()
                    }, label: {
                        Label("Add Note", systemImage: "plus")
                    })
                }
            }
            .sheet(isPresented: $showCreate,
                   content: {
                    NavigationStack {
                        CreateNote()
                    }
                    .presentationDetents([.medium])
            })
        }
    }
    
    private func deleteItem(_ item: NoteItem) {
        // Implement your deletion logic here
        // For example:
        context.delete(item)
        try? context.save()
    }
    
    private func longPressToDelete(_ item: NoteItem) -> some Gesture {
        LongPressGesture(minimumDuration: 1.0) // Customize duration as per your requirement
            .onEnded { _ in
                deleteItem(item)
            }
    }
}
