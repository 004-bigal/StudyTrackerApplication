//
//  WeeklyStudyProgressViewModel.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 7/9/2026.
//

import Foundation
import Combine

class WeeklyStudyProgressViewModel: ObservableObject {
    @Published var sessions: [SessionRecord] = []
    private let studyRepository: StudyRepository
    private let generateWeeklyProgressUseCase: GenerateWeeklyProgressUseCase
    
    init(studyRepository: StudyRepository) {
            self.studyRepository = studyRepository
            self.generateWeeklyProgressUseCase = GenerateWeeklyProgressUseCase(studyRepository: studyRepository)
    }
    
    func weeklyProgressLoad() {
        sessions = generateWeeklyProgressUseCase.executeGenerateWeeklyProgressUseCase()
    }
    
    func dailyProgressChecklist() -> [Bool] {
        let studyCalendar = Calendar.current
        let sessions = self.sessions

        let today = Date()
        let weekday = studyCalendar.component(.weekday, from: today)
        let daysFromMonday = (weekday == 1) ? 6 : weekday - 2

        guard let weeklyStudyStart = studyCalendar.date(byAdding: .day, value: -daysFromMonday, to: today) else { return Array(repeating: false, count: 7) }

        return (0..<7).map { offset in
            let day = studyCalendar.date(byAdding: .day, value: offset, to: weeklyStudyStart)!
            return sessions.contains { studyCalendar.isDate($0.sessionDate, inSameDayAs: day) }
        }
    }
}
