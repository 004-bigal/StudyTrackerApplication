//
//  WeeklyStudyProgressViewModel.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 7/9/2026.
//

import Foundation
import Combine

class WeeklyStudyProgressViewModel: ObservableObject {
    @Published var weeklyStudyProgress: [WeeklyStudyProgress] = []
    let repository: StudyRepository
    
    init(repository: StudyRepository) {
        self.repository = repository
    }
    
    func weeklyProgressLoad() {
        let sessionsFromOverTheWeek = repository.retrieveAllSessionData()
        guard let theWeek = Calendar.current.date(byAdding: .day, value: -7, to: Date()) else { return }
        
        let recentStudySessions = sessionsFromOverTheWeek.filter{ session in session.sessionDate >= theWeek }
        
        var totalStudy = 0
        for session in recentStudySessions {
            let studyMinutes = session.studySessionDuration
            totalStudy = totalStudy + studyMinutes
        }
        
        weeklyStudyProgress = [WeeklyStudyProgress(startDate: theWeek, totalStudyTime: totalStudy, sessions: sessionsFromOverTheWeek)]
    }
    
    func dailyProgressChecklist() -> [Bool] {
        let studyCalendar = Calendar.current
        let sessions = repository.retrieveAllSessionData()

        guard let weeklyStudyStart = studyCalendar.date(byAdding: .day, value: -6, to: Date()) else { return Array(repeating: false, count: 7) }

        return (0..<7).map { offset in
            let day = studyCalendar.date(byAdding: .day, value: offset, to: weeklyStudyStart)!
            return sessions.contains { studyCalendar.isDate($0.sessionDate, inSameDayAs: day) }
        }
    }


}
