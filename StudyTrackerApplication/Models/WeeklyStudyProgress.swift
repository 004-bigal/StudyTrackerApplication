//
//  WeeklyStudyProgress.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 7/9/2026.
//

import SwiftData
import Foundation

// this creates the weekly study progress model
@Model class WeeklyStudyProgress {
    var startDate: Date
    var totalStudyTime: Int
    var sessions = [SessionRecord]()
    
    // initialiser
    init(startDate: Date, totalStudyTime: Int, sessions: [SessionRecord]) {
        self.startDate = startDate
        self.totalStudyTime = totalStudyTime
        self.sessions = sessions
    }
}
