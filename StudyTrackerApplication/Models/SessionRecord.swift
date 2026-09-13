//
//  SessionRecord.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 12/9/2026.
//

import SwiftData
import Foundation

@Model class SessionRecord {
    var subjectID: String = UUID().uuidString
    var subjectName: String
    var studySessionDuration: Int
}
