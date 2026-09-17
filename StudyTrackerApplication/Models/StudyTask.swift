//
//  StudyTask.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 7/9/2026.
//
import SwiftData
import Foundation

// creates the study task model
struct StudyTask: Identifiable {
    var id: UUID
    var taskName: String
    var isTaskDone: Bool
    var dateCreated: Date
    
    // initialiser
    init(id: UUID = UUID(), taskName: String, isTaskDone: Bool, dateCreated: Date) {
        self.id = id
        self.taskName = taskName
        self.isTaskDone = isTaskDone
        self.dateCreated = dateCreated
    }
}
