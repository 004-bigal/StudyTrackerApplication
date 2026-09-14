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
}
