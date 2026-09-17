//
//  StudyTask.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 7/9/2026.
//
import SwiftData
import Foundation

// creates the study task model
// the user creates a study task
// model stores the name of the task and the date it was made
// utilised by the view model as part of the users task list
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
