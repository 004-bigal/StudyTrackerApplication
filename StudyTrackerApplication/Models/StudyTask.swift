//
//  StudyTask.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 7/9/2026.
//
import SwiftData
import Foundation

struct StudyTask: Identifiable {
    var id: UUID
    var taskName: String
    var isTaskDone: Bool
    var dateCreated: Date
    
    init(taskName: String, isTaskDone: Bool, dateCreated: Date) {
        self.id = UUID()
        self.taskName = taskName
        self.isTaskDone = isTaskDone
        self.dateCreated = dateCreated
    }
}
