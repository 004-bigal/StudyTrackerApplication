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
}
