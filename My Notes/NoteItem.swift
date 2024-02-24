//
//  NoteItem.swift
//  iOS App
//
//  Created by Tyler LeFevre on 2/22/24.
//

import Foundation
import SwiftData

// Definition for the NoteItem class
@Model
final class NoteItem {
   var title: String
   var textBody: String
   var timestamp: Date

    init(title: String = "",
         textBody: String = "",
         timestamp: Date = .now) {
        self.title = title
        self.timestamp = timestamp
        self.textBody = textBody
    }
}
