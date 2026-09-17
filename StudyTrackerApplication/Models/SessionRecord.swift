//
//  SessionRecord.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 12/9/2026.
//

import SwiftData
import Foundation

// this code here defines the session record model
@Model class SessionRecord {
    var id = UUID()
    var subjectName: String
    var studySessionDuration: Int
    var sessionDate = Date()
    
    // initialiser 
    init(subjectName: String, studySessionDuration: Int, sessionDate: Date) {
        self.id = UUID()
        self.subjectName = subjectName
        self.studySessionDuration = studySessionDuration
        self.sessionDate = sessionDate
    }
}
