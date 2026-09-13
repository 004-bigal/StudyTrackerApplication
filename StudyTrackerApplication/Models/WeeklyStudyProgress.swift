//
//  WeeklyStudyProgress.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 7/9/2026.
//

import SwiftData
import Foundation

@Model class WeeklyStudyProgress {
    var startDate: Date
    var totalStudyTime: Int
    var sessions = [SessionRecord]()
    
    init(startDate: Date, totalStudyTime: Int, sessions: [SessionRecord]) {
        self.startDate = startDate
        self.totalStudyTime = totalStudyTime
        self.sessions = sessions
    }
}
